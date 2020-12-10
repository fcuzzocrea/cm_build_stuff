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
# device/samsung/msm8226-common
repopick 292140 # msm8226-common: enable TARGET_HAS_MEMFD_BACKPORT

# device/samsung/s3ve3g-common
repopick 292866 # s3ve3g-common: wifi: Move wifi related overlays to new location
repopick 292942 # s3ve3g-common: overlay: Disable wifi AP MAC randomization
repopick 292867 # s3ve3g-common: overlay: Move tethering overlays
repopick 292154 # s3ve3g-common: overlay: Disable BPF offload for tethering
repopick 295438 # s3ve3g-common: overlay: p2p: add p2p regex for tethering modes

# -------------- PLATFORM STUFF --------------

# art
repopick 286185 -P art # art: Conditionally remove version check for memfd_create()

# build
repopick 288657 # Sorry bro: 6 -> 3
repopick 294263 # Remove unused locale data for recovery

# external/perfetto
repopick 287706 -P external/perfetto # perfetto: Conditionally remove version check for memfd_create()

# frameworks/base
repopick 291141 # Keyguard: Allow disabling fingerprint wake-and-unlock

# frameworks/native
repopick 289755 # input: Adjust priority

# hardware/samsung
repopick 256236 # Audio: Fix Ringtone Playing Through The Speaker
repopick 256236 # samsung: AdvancedDisplay: Migrate to androidx

# packages/apps/SetupWizard - To avoid conflict with eleven-recovery-update
repopick 292974 # SetupWizard: Add seedvault restore page in GMS flow

# system/core
repopick 292788 # core: Bring back support for legacy FunctionFS

# system/sepolicy
repopick 292244 # Fix storaged access to /sys/block/mmcblk0/stat after 48027a00
repopick 292766 # sepolicy: Treat proc-based DT fstab the same and sys-based
repopick 292767 # Allow init to write to /proc/cpu/alignment
repopick 292244 # Fix storaged access to /sys/block/mmcblk0/stat after 48027a00

# system/netd
repopick 289818 -P system/netd # netd: Allow devices to force-add directly-connected routes

# vendor/lineage
repopick 289841 # soong: add TARGET_HAS_MEMFD_BACKPORT conditional

# -------------- TOPIC STUFF --------------

repopick -t eleven-samsung-thermal

exit 0
