#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)


PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Boot Control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-mtkimpl.recovery \
    android.hardware.boot@1.1-mtkimpl

PRODUCT_PACKAGES_DEBUG += \
    bootctrl.mt6781

# Runtime Resource (RRO) Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    CarrierConfigOverlay \
    FrameworksResOverlay \
    SettingsOverlay \
    SystemUIOverlay \
    TelephonyOverlay \
    TetheringConfigOverlay \
    WifiOverlay

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# FM
BOARD_HAVE_MTK_FM := true

PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

# Keylayout   
$(DEVICE_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# APN config
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/apn/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-sword

# Light
PRODUCT_PACKAGES += \
    android.hardware.lights-service.mediatek

# Permission 
PRODUCT_COPY_FILES += \
  $(DEVICE_PATH)/configs/permissions/privapp-permissions-imsinit.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/privapp-permissions-imsinit.xml \
  $(DEVICE_PATH)/configs/permissions/com.mediatek.wfo.legacy.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.mediatek.wfo.legacy.xml \
  $(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/privapp-permissions-mediatek.xml

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_PACKAGES += \
    ImsServiceBase \
    ImsInit
    
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/public.libraries-trustonic.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/public.libraries-trustonic.txt

# Init
PRODUCT_PACKAGES += \
    init.mt6781.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.mt6781.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.mt6781.rc

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \

PRODUCT_PACKAGES += \
    fstab.emmc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6781.rc \
    init.mt6781.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    multi_init.rc \
    init.recovery.mt6781.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.emmc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Power/Perf configs
PRODUCT_COPY_FILES += \
    $(foreach file,$(wildcard $(LOCAL_PATH)/config/perf/*), \
        $(file):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/, $(notdir $(file))) )

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/infinix/sword/sword-vendor.mk)
