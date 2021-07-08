#!/usr/bin/env bash

cd ..
cd ..
cd ..
echo "Olives files cloning script"
echo ""
# Clone device trees
echo "Clone device trees..."
git clone https://github.com/mi-msm8937/android_device_xiaomi_msm8937-common device/xiaomi/msm8937-common
git clone https://github.com/mi-msm8937/android_device_xiaomi_sdm439-common device/xiaomi/sdm439-common
echo ""
# Clone kernels
echo "Clone kernels..."
git clone https://github.com/mi-msm8937/android_kernel_xiaomi_msm8937 kernel/xiaomi/msm8937
git clone https://github.com/mi-msm8937/android_kernel_xiaomi_sdm439 -b a11/clean-iwlan kernel/xiaomi/sdm439
echo ""
# Clone vendors
echo "Clone vendors..."
git clone https://github.com/mi-msm8937/proprietary_vendor_xiaomi_msm8937-common vendor/xiaomi/msm8937-common
git clone https://github.com/mi-msm8937/proprietary_vendor_xiaomi_sdm439-common vendor/xiaomi/sdm439-common
git clone https://github.com/mi-msm8937/proprietary_vendor_xiaomi_olives vendor/xiaomi/olives

# Clone camera vendor
echo "Clone camera vendor? yes/no?"
read choice
choice="${choice,,}"
if [ "$choice" == "yes" ]; then
git clone https://github.com/mi-msm8937/proprietary_vendor_xiaomi_olives-camera vendor/xiaomi/olives-camera
elif [ "$choice" == "y" ]; then
git clone https://github.com/mi-msm8937/proprietary_vendor_xiaomi_olives-camera vendor/xiaomi/olives-camera
else
echo "Abort."
fi
echo ""
echo "File cloning completed!"
# Clone end
