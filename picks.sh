#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

function checkchain() {
  git -C $1 fetch github $2
  git -C $1 checkout FETCH_HEAD
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/qcom/sepolicy-legacy
repopick 292386 -P device/qcom/sepolicy-legacy # sepolicy: Switch to BOARD_VENDOR_SEPOLICY_DIRS
repopick 292387 -P device/qcom/sepolicy-legacy # mediacodec_service was removed
repopick 292765 -P device/qcom/sepolicy-legacy # sepolicy: uce service is moved to system side.

# -------------- PLATFORM STUFF --------------

# art
repopick 286185 -P art # art: Conditionally remove version check for memfd_create()

# bionic
repopick 286304 # bionic: Sort and cache hosts file data for fast lookup
repopick 286305 # bionic: Support wildcards in cached hosts file

# bootable/recovery
repopick 288978 -P bootable/recovery # recovery: make /etc/fstab only include entries that match the detected fs type
repopick 289883 -P bootable/recovery # recovery: Don't print mount errors when checking for encryption
repopick 289884 -P bootable/recovery # recovery: Hide unmountable volumes from selection
repopick 289885 -P bootable/recovery # recovery: Implement a volume manager

# external/e2fsprogs
repopick 289446 -P external/e2fsprogs # Mark libext2_blkid as vendor available

# external/gptfdisk
repopick 289917 -P external/gptfdisk # gptfdisk: include gptcl.h after sgdisk.h
repopick 289918 -P external/gptfdisk # gptfdisk: Provide sgdisk_read for direct reads of the partition table
repopick 289919 -P external/gptfdisk # gptfdisk: Build lib for recovery

# external/perfetto
repopick 287706 -P external/perfetto # perfetto: Conditionally remove version check for memfd_create()

# frameworks/base
repopick 291141 # Keyguard: Allow disabling fingerprint wake-and-unlock

# frameworks/av
repopick 292990 # Enable legacy adaptive playback for QCOM_BSP_LEGACY

# frameworks/native
repopick 291971 # SurfaceFlinger: Don't cleanup resource from previous frame

# hardware/lineage/interfaces
repopick 287660 # interfaces: camera: fix two potential null pointer uses
repopick 287661 # interfaces: camera: Implement lockYCbCr stub for Mapper 4.0

# hardware/samsung
repopick 256236 # Audio: Fix Ringtone Playing Through The Speaker
repopick 256236 # samsung: AdvancedDisplay: Migrate to androidx

# packages/apps/SetupWizard - To avoid conflict with eleven-recovery-update
repopick 292974 # SetupWizard: Add seedvault restore page in GMS flow

# system/core
repopick 292788 # core: Bring back support for legacy FunctionFS
repopick 288979 # fs_mgr: autodetect filesystem type
repopick 289914 # core: mark libsysutils and libdiskconfig recovery_available

# system/sepolicy
repopick 292244 # Fix storaged access to /sys/block/mmcblk0/stat after 48027a00
repopick 292766 # sepolicy: Treat proc-based DT fstab the same and sys-based
repopick 292767 # Allow init to write to /proc/cpu/alignment

# system/netd
repopick 289818 -P system/netd # netd: Allow devices to force-add directly-connected routes

# vendor/lineage
repopick 289841 # soong: add TARGET_HAS_MEMFD_BACKPORT conditional
repopick 292258 # soong: Make QCOM legacy variable name more generic
repopick 291988 # qcom: Enable TARGET_USES_QCOM_BSP_LEGACY for B family

# -------------- TOPIC STUFF --------------

repopick -t eleven-samsung-thermal
repopick -t eleven-legacy-bt
repopick -t eleven-legacy-camera
repopick -t eleven-recovery-update
repopick -t eleven-db-migration
repopick -t eleven-scudo-free-libc32

exit 0
