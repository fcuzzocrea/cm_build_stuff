#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/samsung/hlte-common
kpick 207147 # hlte-common: Use sdfat for exfat

# device/samsung/klte-common
kpick 207881 # Revert "klte-common: HAXX: "Fix" race condition in init"
kpick 207882 # klte-common: Mount apnhlos and modem in init
kpick 207883 # klte-common: Use sdfat for exfat

# device/samsung/msm8974-common
kpick 208723 # msm8974-common: Move XTRA_SERVER entries to overlays

# kernel/samsung/msm8974
kpick 207265 # ARM: configs: lineage_*: Disable exfat and vfat

# -------------- PLATFORM STUFF --------------

# frameworks/av
kpick 206430 # CameraService: Fix deadlock in binder death cleanup.
kpick 206431 # libstagefright: Free buffers on observer died
kpick 206432 # Camera: fix use after disconnect error
kpick 206433 # stagefright: ACodec: Resolve empty vendor parameters usage
kpick 206434 # media: fix infinite wait at source for HAL1 based recording
kpick 206435 # libstagefright: use 64-bit usage for native_window_set_usage
kpick 206427 # camera/media: Support legacy HALv1 camera in mediaserver

# system/core
d=`pwd`
cd system/core || exit 1
git remote remove blek > /dev/null 2>&1
git remote add blek https://github.com/invisiblek/android_system_core.git || exit 1
git fetch blek lineage-15.1_safetynet || exit 1
git cherry-pick 96c4433e || exit 1 # init: I hate safety net
cd "$d" || exit 1

# system/sepolicy
kpick 206428 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 206429 # Adapt add_service uses for TARGET_HAS_LEGACY_CAMERA_HAL1

# vendor/lineage
kpick 206426 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable
kpick 206996 # soong_config: Add TARGET_USES_MEDIA_EXTENSIONS variable

# -------------- TOPIC STUFF --------------
repopick -t oreo-button-lights-only-when-pressed

exit 0
