#!/bin/bash

# Define constants
MOUNT="m"
UNMOUNT="u"

# Mount or unmount
while read -p "Mount or unmount (m/u)? " mountOption
do 

# Mount
if [ $mountOption == $MOUNT ]
then
# Create directory
echo "Creating directories..."
cd ~
sudo mkdir -p ./media/bitlocker
sudo mkdir ./media/mount

# Read volumes
sudo fdisk -l
read -p "Choose directory /dev/: " dir

# Unlock and mount
echo "Unlocking..."
sudo dislocker /dev/$dir -u ./media/bitlocker &&
echo "Mounting..." &&
sudo mount ./media/bitlocker/dislocker-file ./media/mount &&
echo "Volume mounted!"
break

# Unmount
elif [ $mountOption == $UNMOUNT ]
then
cd ~
echo "Unmounting volume..."
sudo umount ./media/mount &&
sudo umount ./media/bitlocker &&
echo "Volume unmounted!"
break
fi

done



