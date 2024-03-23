#!/usr/bin/env bash


if [ -d "$APPTAINER_CACHEDIR" ]; then rm -rf $APPTAINER_CACHEDIR; fi


if [ -d "$APPTAINER_SINGULARITY_PATH" ]; then rm -rf $APPTAINER_SINGULARITY_PATH; fi


curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s - $HOME/apptainer-tools


export APPTAINER_CACHEDIR="$HOME/.apptainer/cache"
export APPTAINER_SINGULARITY_PATH="$HOME/apptainer-tools"
export APPTAINER_BIN="$APPTAINER_SINGULARITY_BIN $HOME/apptainer-tools/bin/apptainer"
export SINGULARITY_BIN="$APPTAINER_SINGULARITY_BIN $HOME/apptainer-tools/bin/singularity"

export PATH="$PATH:$APPTAINER_SINGULARITY_PATH/apptainer-tools/bin"

ln -s ~/.local/bin/apptainer $APPTAINER_BIN 
ln -s ~/.local/bin//singularity $APPTAINER_BIN


source ~/.bashrc

$APPTAINER_SINGULARITY_PATH/bin/apptainer  pull -F --name ./nwchems_`id -u`.img oras://ghcr.io/edoapra/nwchem-singularity/nwchem-dev.ompi41x:latest


