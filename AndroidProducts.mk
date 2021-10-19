#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#SuperiorOS
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/superior_olives.mk

COMMON_LUNCH_CHOICES := \
    superior_olives-user \
    superior_olives-userdebug \
    superior_olives-eng

#ArrowOS
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/arrow_olives.mk

COMMON_LUNCH_CHOICES := \
    arrow_olives-user \
    arrow_olives-userdebug \
    arrow_olives-eng

#LOS
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_olives.mk

COMMON_LUNCH_CHOICES := \
    lineage_olives-user \
    lineage_olives-userdebug \
    lineage_olives-eng

#AOSP
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_olives.mk

COMMON_LUNCH_CHOICES := \
    aosp_olives-user \
    aosp_olives-userdebug \
    aosp_olives-eng

#Nusantra
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/nad_olives.mk

COMMON_LUNCH_CHOICES := \
    nad_olives-user \
    nad_olives-userdebug \
    nad_olives-eng
