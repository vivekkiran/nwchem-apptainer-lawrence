#!/usr/bin/env bash
# apptainer remote add --no-login SylabsCloud cloud.sycloud.io
apptainer pull --arch amd64 docker://rockylinux/rockylinux:9


#  apptainer build --sandbox tl --arch amd64 docker://rockylinux/rockylinux:9

curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo | \
  sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo


yum-config-manager --enable nvidia-container-toolkit-experimental
yum install -y nvidia-container-toolkit


apptainer build --sandbox rockylinux-gpu  --arch amd64 docker://rockylinux/rockylinux:9

apptainer run ---nvccli rockylinux-gpu.sif

# apptainer pull ghcr.io/easybuilders/almalinux-8.6