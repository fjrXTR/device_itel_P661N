#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from P661N device
$(call inherit-product, device/itel/P661N/device.mk)

PRODUCT_DEVICE := P661N
PRODUCT_NAME := lineage_P661N
PRODUCT_BRAND := Itel
PRODUCT_MANUFACTURER := itel

PRODUCT_GMS_CLIENTID_BASE := android-itel

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sys_tssi_64_armv82_itel-user 13 TP1A.220624.014 610912 release-keys"

BUILD_FINGERPRINT := Itel/P661N-GL/itel-P661N:12/SP1A.210812.016/240515V87:user/release-keys
