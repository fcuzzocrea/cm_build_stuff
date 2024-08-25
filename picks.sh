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

# device/samsung_slsi/sepolicy
# repopick 357508 # sepolicy: add policy for super fast charge

# device/lineage/sepolicy
# repopick 357348 # sepolicy: add policy for super fast charge

# device/xiaomi/sm8250-common
repopick 390713 # sm8250-common: rootdir: Set permission for pcie wlan rx
repopick 390714 # sm8250-common: sepolicy: Allow ueventd to read vendor_persist_wcnss_service_file
repopick 398045 # sm8250-common: sepolicy: Label wakeup nodes from pipa
repopick 399007 # sm8250-common: label some pipa power_supply sysfs
repopick 399008 # sm8250-common: sepolicy: label persist.vendor.EnableP3ColorSpace
repopick 399009 # sm8250-common: sepolicy: label /data/vendor/sensor_log

# device/xiaomi/pipa
repopick 376507 376508 376509 376510 376513 376519 376520 376524 376525 376527 376529 376530 388725 398051 399010

# kernel/xiaomi/sm8250
checkchain kernel/xiaomi/sm8250 refs/changes/83/388683/4

# -------------- PLATFORM STUFF --------------

# bootable/recovery
repopick 398771 # minui: Import graphics_drm fix from QSSI 13

# build
repopick -f 369796 # Sorry bro: 6 -> 3

# frameworks/base
repopick -f -P frameworks/base 385457 # base: Initial SenseProvider for FaceSense service
repopick -f -P frameworks/base 385463 # SystemUI: Implement face unlock recognition animation and text
repopick -f -P frameworks/base 385464 # SystemUI: Use proper tint for face unlock icon
repopick -f -P frameworks/base 391097 # SystemUI: biometrics: Follow user setting to confirm face unlock
repopick -f -P frameworks/base 385512 # BiometricScheduler: Cancel operation if not idle
repopick -f -P frameworks/base 397585 # base: Add three-fingers-swipe to screenshot [1/2]
repopick -f -P frameworks/base 397586 # Improvements for swipe to screenshot
repopick -f -P frameworks/base 397587 # SwipeToScreenshot: Import MIUI implementation
repopick -f -P frameworks/base 369786 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f -P frameworks/base 369787 # keystore: Block key attestation for SafetyNet
repopick -f -P frameworks/base 369788 # AttestationHooks: Set shipping level to 32 for devices >=33
repopick -f -P frameworks/base 369789 # Limit SafetyNet workarounds to unstable GMS process
repopick -f -P frameworks/base 369790 # gmscompat: Apply the SafetyNet workaround to Play Store aswell
repopick -f -P frameworks/base 369791 # gmscompat: Use Nexus 6P fingerprint for CTS/Integrity
repopick -f -P frameworks/base 369792 # gmscompat: Make CTS/Play Integrity pass again
repopick -f -P frameworks/base 374392 # gmscompat: Use new info
repopick -f -P frameworks/base 357510 # gmscompat: also spoof props for samsung/sec apps

# hardware/samsung_slsi-linaro/configs

# hardware/samsung_slsi-linaro/exynos

# hardware/samsung_slsi-linaro/graphics
repopick 384848 # WIP: libhwc2.1: invalidate last frame before changing display mode

# hardware/samsung_slsi-linaro/interfaces

# hardware/lineage/interfaces
# repopick 357349 # fastcharge: add super fast charge support

# hardware/samsung
# repopick 357350 # fastcharge: move 1.0 impl to separate folder
# repopick 357351 # hidl: fastcharge: add 1.1 impl

# packages/apps/Settings
repopick -f 385494 # Add Face Unlock with ParanoidSense
repopick -f 385495 # Settings: Import missing Face Unlock animation
repopick -f 391308 # Settings: Add three-fingers-swipe to screenshot [2/2]
# repopick 357352 # Settings: add super fast charge toggle

# packages/overlays/Lineage
repopick -f 400129 # lineage: Moar fontz

# vendor/lineage
repopick -f -P vendor/lineage 385496 # faceunlock
repopick -f -P vendor/lineage 381475 # SystemUI: More notification icons on AOD screen
repopick -f -P vendor/lineage 369794 # lineage: Disable privapp permission enforcement (make it log)
repopick -f -P vendor/lineage 369795 # adb insecure by default
# repopick 357968 # config: add super fast charge interface

exit 0
