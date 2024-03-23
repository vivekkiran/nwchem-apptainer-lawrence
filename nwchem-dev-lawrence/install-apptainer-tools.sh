#!/usr/bin/env bash

curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s - apptainer-tools


./apptainer-tools/bin/apptainer  pull -F --name ./nwchems_`id -u`.img oras://ghcr.io/edoapra/nwchem-singularity/nwchem-dev.ompi41x:latest

rm -r "$HOME/apptainer-tools/bin"
export APPTAINER_CACHEDIR="$HOME/.apptainer/cache"
export APPTAINER_SINGULARITY_PATH="$HOME/apptainer-tools/bin"

