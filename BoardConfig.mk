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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from common lt02
-include device/samsung/lt02-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := lt02wifi,lt02wifiue

# Kernel
BOARD_KERNEL_BASE            := 0x10000000
BOARD_MKBOOTIMG_ARGS         := --ramdisk_offset 0x01000000
BOARD_KERNEL_PAGESIZE        := 2048
TARGET_KERNEL_SOURCE         := kernel/samsung/lt02-common
TARGET_KERNEL_VARIANT_CONFIG := pxa986_lt02_defconfig
TARGET_KERNEL_CONFIG         := pxa986_lt02wifiue_defconfig

TARGET_BOOTLOADER_BOARD_NAME := PXA986

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/lt02-common/rootdir/etc/fstab.pxa988

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1507852288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5775556608
BOARD_FLASH_BLOCK_SIZE := 4096

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/lt02-common/bluetooth

# TWRP
DEVICE_RESOLUTION := 1024x600
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"

# Graphics
USE_OPENGL_RENDERER := true
BOARD_USE_BGRA_8888 := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"

BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.mrvl

# Platform
TARGET_BOARD_PLATFORM := mrvl
TARGET_CPU_VARIANT := cortex-a9

# Architecture
TARGET_CPU_SMP := true

# Flags for Krait CPU
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Marvell configuration
BOARD_EGL_CFG := device/samsung/pxa986-common/configs/egl.cfg

# Wifi driver
BOARD_HAVE_MARVELL_WIFI          := true
BOARD_WLAN_DEVICE                := mrvl
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WIFI_EXT_MODULE_PATH             := "/system/lib/modules/mlan.ko"
WIFI_EXT_MODULE_NAME             := "mlan"
WIFI_EXT_MODULE_ARG              := ""
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/sd8xxx.ko"
WIFI_DRIVER_MODULE_NAME	         := "sd8xxx"
WIFI_DRIVER_MODULE_ARG           := "drv_mode=5 cfg80211_wext=12 sta_name=wlan uap_name=wlan wfd_name=p2p fw_name=mrvl/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/proc/mwlan/config"
WIFI_DRIVER_FW_PATH_STA          := "drv_mode=5"
WIFI_DRIVER_FW_PATH_AP           := "drv_mode=6"
WIFI_DRIVER_FW_PATH_P2P          := "drv_mode=5"

# MRVL
BOARD_USES_MRVL_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMRVL_HARDWARE

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true

# Graphics
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_NEEDS_FNW := true
BOARD_USE_MHEAP_SCREENSHOT := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 17
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Audio
BOARD_USES_ALSA_AUDIO := true
