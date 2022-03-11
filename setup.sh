#!/bin/bash

echo "Which OS want to setup? [mac/raspberry]"
echo ""
while true; do
    
    echo "Which OS want to setup? [ mac / raspberry ]"
    echo "default is mac"
    read READ_OS 
    [[ $READ_OS == "" ]] && READ_OS="mac"
done

echo ""
echo "Setupping $READ_OS"
git clone https://github.com/frani/setup frani_setup_os
cd frani_setup_os
chmod +x $(echo "setup_$READ_OS.sh")
./setup_$READ_OS.sh
