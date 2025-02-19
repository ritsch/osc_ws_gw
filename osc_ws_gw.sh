#! /bin/sh
#
# run script wrapper for Python virtual environment
#
# Copyright (c) 2021 ZKM | Hertz-Lab
# Dan Wilcox <dan.wilcox@zkm.de>
# Winfried Ritsch
#
# BSD Simplified License.
# For information on usage and redistribution, and for a DISCLAIMER OF ALL
# WARRANTIES, see the file, "LICENSE.txt," in this distribution.
#

DIR="$(dirname $0)"
SCRIPT=osc_ws_gw.py

. "$DIR"/venv/bin/activate
"$DIR"/$SCRIPT $@
deactivate