#!/usr/bin/env bash


#Delete APPTAINER_CACHE
if [ -d "$APPTAINER_CACHEDIR" ]; then rm -rf $APPTAINER_CACHEDIR; fi


#Delete APPTAINER/SINGULARITY
if [ -d "$APPTAINER_SINGULARITY_PATH" ]; then rm -rf $APPTAINER_SINGULARITY_PATH; fi


#Install unprivileged from pre-built binaries

# A script is available to make a relocatable unprivileged binary installation of Apptainer, 
# including all dependencies that are not normally installed on Linux systems. 
# The script works on current Red Hat Enterprise Linux-derived systems, Fedora, SUSE/OpenSUSE, Debian, and Ubuntu.

curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s - $HOME/apptainer-tools


export APPTAINER_CACHEDIR="$HOME/.apptainer/cache"
export APPTAINER_SINGULARITY_PATH="$HOME/apptainer-tools"
export APPTAINER_BIN="$APPTAINER_SINGULARITY_PATH/bin/apptainer"
export SINGULARITY_BIN="#APPTAINER_SINGULARITY_PATH/bin/singularity"

export PATH="$PATH:$APPTAINER_SINGULARITY_PATH/bin"

ln -s $APPTAINER_SINGULARITY_PATH ~/.local/bin


source ~/.bashrc
source ~/.bash_profile
