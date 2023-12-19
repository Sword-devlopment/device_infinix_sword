#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from sword device
$(call inherit-product, device/infinix/sword/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := sword
PRODUCT_NAME := lineage_sword
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Note 11S
PRODUCT_MANUFACTURER := infinix

# Build info
PRODUCT_GMS_CLIENTID_BASE := android-transsion
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sys_tssi_64_infinix-user 11 RP1A.200720.011 293430 release-keys"
BUILD_FINGERPRINT := Infinix/X698-GL/Infinix-X698:11/RP1A.200720.011/230406V641:user/release-keys

