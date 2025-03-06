# `osc_ws_gw`

Relay messages between UDP and a websocket as gateway.

This code base is forked from baton by [ZKM | Hertz-Lab](https://zkm.de/en/about-the-zkm/organization/hertz-lab).

The difference to baton is we extend it to use TCP/IP instead of UDP for OSC connection, since no message should be missed.

## Description

This script acts as a websocket relay server which creates a local websocket and forwards messages to/from a set of TCP/IP ports or UDP Port. This is useful for creative coding tools which work with OSC (Open Sound Control) messages natively, but do not have built-in websocket support.

## Dependencies

* Python 3
* [websockets library](https://github.com/aaugustin/websockets)

## Setup

Install Python 3, if not already available. For instance, on macOS using [Homebrew](http://brew.sh):

```shell
brew install python3
```

Create a virtual environment and install the script's dependencies:

```shell
make
```

## Running

Next, start the server on the commandline via the virtual environment wrapper script:

  ./osc_ws_gw

It can simply sit in the background and automatically handles the websocket connection. Websocket clients can then connect to send/receive messages while osc_ws_gw is active.

To configure the send/receive address and ports, see the commandline argument help for osc_ws_gw by running:

  ./osc_ws_gw -h

Defaults are:

* websocket: ws://localhost:8081
* udp recv: 127.0.0.1 5555
* udp send: 127.0.0.1 4444
* tcp/ip: 127.0.0.1 3333

_Note: To connect external devices to the machine running osc_ws_gw, "localhost" cannot be used and only clients running on the same machine will be able to connect. Use the network IP address or local DNS hostname instead for osc_ws_gw and both local and remote clients, ie. 192.168.0.101, etc.

To stop osc_ws_gw, use CTRL+C to issue an interrupt signal.

### Calling Python script directly

The Python script can be called directly without the wrapper script, but requires manually enabling or disabling the virtual environment:

Aactivate the virtual environment before the first run in a new commandline session:

  source venv/bin/activate

Use:

  ./osc_ws_gw.py -h

When finished, deactivate the virtual environment with:

  deactivate

## Example Clients

A couple of example clients are included:

* html/client: HTML+JS websocket client, open index.html in your browser
* pd/osclient.pd: Pure Data patch which sends and receives OSC messages over UDP 

Both examples should work together with the default address & ports on the same localhost

```
  pd/client.pd <- UDP -> osc_ws_gw.py <- WS -> html/client/index.html
```

First start osc_ws_gw, then start the clients. If the html client was started first, reload the page to reestablish the connection.

To connect clients running on different computers, you may need to change the websocket and/or UDP address and port values.

## License

BSD Simplified License.

Copyright (c) 2021 ZKM | Karlsruhe.  
Copyright (c) 2021 Dan Wilcox.  
Copyright (c) 2025 Winfried Ritsch
