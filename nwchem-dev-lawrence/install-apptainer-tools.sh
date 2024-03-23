#!/usr/bin/env bash

export APPTAINER_CACHEDIR="$HOME/.apptainer/cache"
export APPTAINER_SINGULARITY_PATH="$HOME/apptainer-tools"



while getopts delete-cache:delete-apptainer flag
do
    case "${flag}" in
        a) delete-cache=${OPTARG};;
        b) delete-apptainer=${OPTARG};;
    esac
done


if $delete-cache; then
      echo "-delete-cache was triggered, Parameter: $OPTARG" >&2
      if [ -d "$APPTAINER_CACHEDIR" ]; then rm -Rf $APPTAINER_CACHEDIR; fi
fi


if $elete-apptainer; then
 echo "-delete-apptainer was triggered, Parameter: $OPTARG" >&2
      if [ -d "$APPTAINER_SINGULARITY_PATH" ]; then rm -Rf $APPTAINER_SINGULARITY_PATH; fi

fi



curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s - $HOME/apptainer-tools


./apptainer-tools/bin/apptainer  pull -F --name ./nwchems_`id -u`.img oras://ghcr.io/edoapra/nwchem-singularity/nwchem-dev.ompi41x:latest
