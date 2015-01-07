# Copyright (C) 2014 The CyanogenMod Project
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

# Inherit from lt02-common
$(call inherit-product, device/samsung/lt02-common/lt02-common.mk)

# IR packages
PRODUCT_PACKAGES += \
    consumerir.mrvl

# IR feature permission
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/lt02-common/lt02-common-vendor.mk)

# Common overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/lt02-common/overlay

PRODUCT_CHARACTERISTICS := tablet

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH  := 600

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf

# Media Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/88pm80x_on.kl:system/usr/keylayout/88pm80x_on.kl \
    $(LOCAL_PATH)/keylayout/88pm800_hook_vol.kl:system/usr/keylayout/88pm800_hook_vol.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init.pxa988.rc \
    init.pxa988.tel.rc \
    init.pxa988.usb.rc \
    init.recovery.pxa988.rc \
    init.wifi.rc \
    lpm.rc \
    ueventd.pxa988.rc

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Lights
#PRODUCT_PACKAGES += lights.mrvl

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# Common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc \
    ro.sf.hwrotation=270 \
    ro.sf.lcd_density=160 \
    ro.tel.config.path=/system/etc/tel/ \
    wifi.interface=wlan0

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml	\
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# Marvell Wireless Daemon
PRODUCT_PACKAGES += \
    MarvellWirelessDaemon

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Charger
PRODUCT_PACKAGES += charger charger_res_images

# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
