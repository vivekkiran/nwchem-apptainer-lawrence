#!/bin/bash
#SBATCH -N 2
#SBATCH -t 00:29:00
#SBATCH -A allocation_name
#SBATCH --ntasks-per-node 36
#SBATCH -o singularity_library.output.%j
#SBATCH -e ./singularity_library.err.%j
#SBATCH -J singularity_library
#SBATCH --export ALL
source /etc/profile.d/modules.sh
# export https_proxy=http://proxy.emsl.pnl.gov:3128

export SLURM_NNODES=1
export SLURM_NTASKS=1

module purge
module load gcc/13.1.0
module load openmpi/4.1.4
mkdir "$HOME/nwchem_oras"
export NWCHEM_DIR="$HOME/nwchem_oras"
singularity pull -F --name ~/nwchem_`id -u`.img  oras://ghcr.io/edoapra/nwchem-singularity/nwchem-dev.ompi41x:latest
srun -N $SLURM_NNODES -n $SLURM_NTASKS cp ~/nwchem_`id -u`.img $NWCHEM_DIR/nwchem.img
srun singularity exec $NWCHEM_DIR/nwchem.img nwchem "input file"