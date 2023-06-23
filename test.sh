#!/bin/bash
echo $REINSTALL_NIX
[ $REINSTALL_NIX="TRUE" ] && echo "Condition is TRUE" || echo "Condition is False" 
if [ $REINSTALL_NIX="TRUE" ] 
then 
    export REINSTALL_NIX=FALSE
    echo $REINSTALL_NIX
fi
echo $REINSTALL_NIX
