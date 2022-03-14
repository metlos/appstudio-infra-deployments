#!/bin/bash
#This script sets up the pre-requisites for setting up app-studio in local machine.
# mainly setting up pip3,yq, kubectl, kustomize
# Firstly it checks which type of system is running this
# Then it installs the dependencies one by one

OSTYPE_VAR=$(echo $OSTYPE)
OSNAME=$(grep '^NAME=' /etc/os-release)
echo $OSNAME
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/..
echo $ROOT
#TODO: check the ROOT directory

case $OSNAME in
  *"Fedora"*)
    echo "I am in Fedora"
    $ROOT/redhat-based.sh
    $ROOT/prepare-crc.sh
    ;;

  *"Ubuntu"*)
    echo "I am in Ubuntu"
    $ROOT/debian-based.sh
    $ROOT/prepare-crc.sh
    ;;
esac

