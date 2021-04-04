#!/bin/bash

if [ ! -d libraries ]; then
    mkdir libraries
fi


sudo ./scripts/root-script.sh
./scripts/user-script.sh