# NWChem Apptainer
[![nwchem_apptainer](https://github.com/edoapra/nwchem-singularity/actions/workflows/apptainer_action.yml/badge.svg)](https://github.com/edoapra/nwchem-singularity/actions/workflows/apptainer_action.yml)

Singularity/Apptainer recipes for NWChem 

This repository is contains Singularity/Apptainer Recipies to run NWChem on Lawrence HPC at University of South Dakota


Notes:
Running apptainer buildcfg will show the build configuration of an installed version of Apptainer, and lists the paths used by Apptainer. Use apptainer buildcfg to confirm paths are set correctly for your installation, and troubleshoot any ‘not-found’ errors at runtime.

Note that the LOCALSTATEDIR and SESSIONDIR should be on local, non-shared storage.


To Remove an old version
In a standard installation of Apptainer (when building from source), the command sudo make install lists all the files as they are installed. You must remove all of these files and directories to completely remove Apptainer.

 sudo rm -rf \
    /usr/local/libexec/apptainer \
    /usr/local/var/apptainer \
    /usr/local/etc/apptainer \
    /usr/local/bin/apptainer \
    /usr/local/bin/run-singularity \
    /usr/local/etc/bash_completion.d/apptainer



Source bash completion file

To enjoy bash shell completion with Apptainer commands and options, source the bash completion file:

$ . /usr/local/etc/bash_completion.d/apptainer

Add this command to your ~/.bashrc file so that bash completion continues to work in new shells. (Adjust the path if you installed Apptainer to a different location.)






References:

Based on earlier work by Edoardo Apra <edoardo.apra@pnnl.gov> and Vladimir Konjkov <Konjkov.VV@gmail.com>


See https://github.com/edoapra/nwchem-singularity/tree/master/nwchem-dev.ompi41x   
and    
https://nwchemgit.github.io/Containers.html#instruction-for-running-on-emsl-tahoma


Apptainer Docs:
https://apptainer.org/docs/admin/1.0/installation.html