#!/usr/bin/env bash


if [ -d "$APPTAINER_CACHEDIR" ]; then rm -rf $APPTAINER_CACHEDIR; fi


if [ -d "$APPTAINER_SINGULARITY_PATH" ]; then rm -rf $APPTAINER_SINGULARITY_PATH; fi


curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s - $HOME/apptainer-tools


export APPTAINER_CACHEDIR="$HOME/.apptainer/cache"
export APPTAINER_SINGULARITY_PATH="$HOME/apptainer-tools"


$APPTAINER_SINGULARITY_PATH/bin/apptainer  pull -F --name ./nwchems_`id -u`.img oras://ghcr.io/edoapra/nwchem-singularity/nwchem-dev.ompi41x:latest
