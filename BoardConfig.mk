#
# Copyright (C) 2018 The LineageOS Project
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

DEVICE_PATH := device/lge/judyln

# inherit from common v40
-include device/lge/sdm845-common/BoardConfigCommon.mk

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BTHW_FW_EXTENDED_CONFIGURATION := true
BTHW_FW_EXTENDED_CONFIGURATION_ONLY_I2SPCM_CONFIG = := false

# Camera
TARGET_USES_YCRCB_VENUS_CAMERA_PREVIEW := true

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hardware=judyln
TARGET_KERNEL_CONFIG := judyln_lao_com-perf_defconfig

BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/lineagehw

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 48708296704
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDORIMAGE_PARTITION_SIZE := 1048576000

BOARD_ROOT_EXTRA_FOLDERS := oem persdata
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/eri:/eri \
    /mnt/vendor/absolute:/persdata/absolute \
    /vendor/firmware_mnt:/firmware

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.judyln
TARGET_PREBUILT_RECOVERY_RAMDISK_CPIO := $(DEVICE_PATH)/ramdisk-recovery.cpio

# Vendor init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_judyln
TARGET_RECOVERY_DEVICE_MODULES := libinit_judyln


# inherit from the proprietary version
-include vendor/lge/judyln/BoardConfigVendor.mk
