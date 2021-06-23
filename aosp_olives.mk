#
# Copyright (C) 2021 The Pixel Experience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit some common Pixel Experience stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_INCLUDE_LIVE_WALLPAPERS := false

# Inherit from olives device
$(call inherit-product, device/xiaomi/olives/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := olives
PRODUCT_NAME := aosp_olives
BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := olives
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "google/redfin/redfin:11/RQ3A.210605.005/7349499:user/release-keys"
