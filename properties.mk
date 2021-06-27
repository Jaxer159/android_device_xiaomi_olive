#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.camera.aec.sync=1 \
persist.vendor.camera.awb.sync=2 \
persist.vendor.camera.expose.aux=1

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.ctm.disallowed=true
