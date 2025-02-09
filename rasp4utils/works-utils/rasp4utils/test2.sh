#!/bin/bash

if [ $# -eq 2 ]; then
    echo "two argument"
    if [ $2 == true ]; then
        echo "second arg is true"
    else
        echo "second arg is false"
    fi
else
    echo "not two argument"
fi
