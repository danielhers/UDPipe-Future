#!/bin/bash

/usr/bin/python3 -m virtualenv venv -p /usr/bin/python3
. venv/bin/activate
pip install tensorflow$1==1.5.0
pip install cython
pip install git+https://github.com/andersjo/dependency_decoding
