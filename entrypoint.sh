#!/bin/bash

if [ `id -u` = 0 ]; then
    echo "Please do not run me as root!"
    exit 1
fi

mkdir -p `condor_config_val EXECUTE`
mkdir -p `condor_config_val LOG`
mkdir -p `condor_config_val LOCK`
mkdir -p `condor_config_val RUN`
mkdir -p `condor_config_val SPOOL`

mkdir -p ~/.condor/tokens.d
echo "$TOKEN" >~/.condor/tokens.d/flock.opensciencegrid.org
chmod 600 ~/.condor/tokens.d/flock.opensciencegrid.org

tail -F `condor_config_val LOG`/MasterLog `condor_config_val LOG`/StartLog &

condor_master -f

