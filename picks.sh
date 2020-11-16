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


# -------------- PLATFORM STUFF --------------

# art
repopick 286185 -P art # art: Conditionally remove version check for memfd_create()

# bionic
repopick 286304 # bionic: Sort and cache hosts file data for fast lookup
repopick 286305 # bionic: Support wildcards in cached hosts file

# bootable/recovery
repopick -f 286351 -P bootable/recovery # init: update recovery when enabled in settings

# external/perfetto
repopick 287706 -P external/perfetto # perfetto: Conditionally remove version check for memfd_create()

# frameworks/base
repopick 291141 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 292107 # sensors: Create bool to select what timestamp to use

# frameworks/native
repopick 291971 # SurfaceFlinger: Don't cleanup resource from previous frame

# hardware/lineage/interfaces
# repopick 287659 # interfaces: Camera: add IAllocator/IMapper 4.0 to camera HIDL
repopick 287660 # interfaces: camera: fix two potential null pointer uses
repopick 287661 # interfaces: camera: Implement lockYCbCr stub for Mapper 4.0
repopick 287666 # Wifi: Uprev Wifi HAL to 1.4
repopick 287667 # Wifi: Add 802.11ax support to RTT
repopick 287668 # Wifi: Support check on device capability for 6GHZ
repopick 287669 # Wifi: Add 6GHz bands to WifiBand
repopick 287670 # Wifi: Add 6GHz band to NAN structures and methods
repopick 287671 # Remove 6GHz capability query through HAL
repopick 287672 # Fix 6GHz support for NAN
repopick 287673 # wifi: Convert LazyServiceRegistrar usage to singleton

# hardware/samsung
repopick 256236 # Audio: Fix Ringtone Playing Through The Speaker
repopick 256236 # samsung: AdvancedDisplay: Migrate to androidx

# packages/apps/SetupWizard
repopick 292363 # Switch button brightness from int to float

# system/core
repopick 289133 # core: Add back support for legacy adbd

# vendor/lineage
repopick 289841 # soong: add TARGET_HAS_MEMFD_BACKPORT conditional
repopick 292258 # soong: Make QCOM legacy variable name more generic
repopick 291988 # qcom: Enable TARGET_USES_QCOM_BSP_LEGACY for B family

# -------------- TOPIC STUFF --------------

repopick -t eleven-samsung-thermal
repopick -t eleven-legacy-bt
repopick -t eleven-s3ve3g

exit 0
