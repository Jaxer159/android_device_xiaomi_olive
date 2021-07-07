#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#LineageOS
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_olives.mk

COMMON_LUNCH_CHOICES := \
    lineage_olives-user \
    lineage_olives-userdebug \
    lineage_olives-eng

#PixelExperience
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_olives.mk

COMMON_LUNCH_CHOICES := \
    aosp_olives-user \
    aosp_olives-userdebug \
    aosp_olives-eng

#Xtended
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/xtended_olives.mk

COMMON_LUNCH_CHOICES := \
    xtended_olives-user \
    xtended_olives-userdebug \
    xtended_olives-eng
