#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#ArrowOs
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/arrow_olives.mk

COMMON_LUNCH_CHOICES := \
    arrow_olives-user \
    arrow_olives-userdebug \
    arrow_olives-eng

#LineageOS
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_olives.mk

COMMON_LUNCH_CHOICES := \
    lineage_olives-user \
    lineage_olives-userdebug \
    lineage_olives-eng
