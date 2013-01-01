#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/small_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Dream/Sapphire overlays
DEVICE_PACKAGE_OVERLAYS := device/htc/dream_sapphire/overlay

# Dream/Sapphire build.prop overides
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_BOOTLOADER_BOARD_NAME=sapphire

# Dream/Sapphire uses MDPI
PRODUCT_LOCALES += mdpi

# fstab
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/fstab/vold.fstab:system/etc/vold.fstab

# Call proprietary side of the device
$(call inherit-product-if-exists, vendor/htc/dream_sapphire/dream_sapphire-vendor.mk)

# Packages
PRODUCT_PACKAGES += \
    VoiceDialer \
    sensors.trout \
    sensors.sapphire \
    sapphire-keypad.kcm \
    trout-keypad.kcm \
    trout-keypad-v2.kcm \
    trout-keypad-v3.kcm \
    trout-keypad-qwertz.kcm \
    wlan.ko \
    vold.fstab \
    wlan_loader \
    tiwlan.ini \
    libOmxCore \
    gps.trout \
    gps.sapphire \
    copybit.msm7k \
    gralloc.msm7k \
    lights.msm7k

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/ramdisk/init.trout.rc:root/init.trout.rc \
    device/htc/dream_sapphire/prebuilt/ramdisk/init.sapphire.rc:root/init.sapphire.rc \
    device/htc/dream_sapphire/prebuilt/ramdisk/ueventd.trout.rc:root/ueventd.trout.rc \
    device/htc/dream_sapphire/prebuilt/ramdisk/ueventd.sapphire.rc:root/ueventd.sapphire.rc

# Device props
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/device/build.trout.prop:system/build.trout.prop \
    device/htc/dream_sapphire/prebuilt/device/build.sapphire.prop:system/build.sapphire.prop

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/keylayouts/trout-keypad.kl:system/usr/keylayout/trout-keypad.kl \
    device/htc/dream_sapphire/prebuilt/keylayouts/trout-keypad-qwertz.kl:system/usr/keylayout/trout-keypad-qwertz.kl \
    device/htc/dream_sapphire/prebuilt/keylayouts/trout-keypad-v2.kl:system/usr/keylayout/trout-keypad-v2.kl \
    device/htc/dream_sapphire/prebuilt/keylayouts/trout-keypad-v3.kl:system/usr/keylayout/trout-keypad-v3.kl \
    device/htc/dream_sapphire/prebuilt/keylayouts/sapphire-keypad.kl:system/usr/keylayout/sapphire-keypad.kl \
    device/htc/dream_sapphire/prebuilt/keylayouts/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/keychars/trout-keypad.kcm:system/usr/keychars/trout-keypad.kcm \
    device/htc/dream_sapphire/prebuilt/keychars/trout-keypad-qwertz.kcm:system/usr/keychars/trout-keypad-qwertz.kcm \
    device/htc/dream_sapphire/prebuilt/keychars/trout-keypad-v2.kcm:system/usr/keychars/trout-keypad-v2.kcm \
    device/htc/dream_sapphire/prebuilt/keychars/trout-keypad-v3.kcm:system/usr/keychars/trout-keypad-v3.kcm \
    device/htc/dream_sapphire/prebuilt/keychars/sapphire-keypad.kcm:system/usr/keychars/sapphire-keypad.kcm

# Audio configuration
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/audio/02audio_profile:system/etc/init.d/02audio_profile \
    device/htc/dream_sapphire/prebuilt/audio/AudioPara_dream.csv:system/etc/AudioPara_dream.csv \
    device/htc/dream_sapphire/prebuilt/audio/AudioPara_sapphire.csv:system/etc/AudioPara_sapphire.csv

# Media configuration
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/media/media_profiles.xml:/system/etc/media_profiles.xml

# Kernel stuff
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/dream_sapphire/prebuilt/kernel/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/kernel/wlan.ko:/system/lib/modules/wlan.ko

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)
