#!/bin/bash -ex

# Import ContainerTools
source ContainerTools

# Create specified data directory if it doesn't exist.  Defaults to Wings default.
log "Preparing workdir: ${DATADIR}"
if [ ! -d $DATADIR ]; then
    mkdir -p $DATADIR
fi

# Halt container boot unless the config file is present.  Wings will not start without it.
log "Checking for $DATADIR/config.yml before beginning execution"
COUNT=1
while [ ! -e $DATADIR/config.yml ]; do
    log "Attempt $COUNT, config file \"config.yml\" not present in \"$DATADIR\" - retrying in 15 seconds"
    ((COUNT=COUNT+1))
    sleep 15
done
log "Config file found, starting Wings"
