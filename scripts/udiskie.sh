#!/bin/bash

# kill all udiskie instances
killall -q udiskie

# launch it
udiskie &
