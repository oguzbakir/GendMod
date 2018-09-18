#!/bin/bash
# Run with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

CUDA90='https://developer.download.nvidia.com/compute/cuda/9.0/secure/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb'

CUDNN70='https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.0.5/prod/9.0_20171129/Ubuntu16_04-x64/libcudnn7_7.0.5.15-1%2Bcuda9.0_amd64.deb'

CUDNN70DEV='https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.0.5/prod/9.0_20171129/Ubuntu16_04-x64/libcudnn7-dev_7.0.5.15-1%2Bcuda9.0_amd64.deb'

LINKS=($CUDA90 $CUDNN70 $CUDNN70DEV)

FILENAMES=(cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64.deb)

PACKAGES=(cuda-9-0 libcudnn7 libcudnn7-dev)

if [ ! -d boosters/ ]
then
	mkdir boosters/
fi
chmod -R 777 boosters/
cd boosters/

r=0

for i in $CUDA90 $CUDNN70 $CUDNN70DEV
	do
	t=$( dpkg -s ${PACKAGES[$r]} | grep Status )
	if [ -z "$t" ]
	then
		if [ ! -f ${FILENAMES[$r]} ]
		then
			curl -OJ $i
		else
			dpkg -i ${FILENAMES[$r]}
			apt update
			apt install ${PACKAGES[$r]}
		fi
	else
		break
	fi
	((r++))
done




