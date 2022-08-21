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

# device/samsung/herolte
# repopick 320464 # herolte: remove liboemcrypto
# repopick 320463 # herolte: init: fix include path

# device/samsung/hero2lte
# repopick 319222 # hero2lte: remove liboemcrypto
# repopick 320465 # hero2lte: init: fix include path

# device/samsung/klimt-common
# repopick -g https://review.exynos5420.com 7791 # [DNM] klimt: remove touch hal for now

# device/samsung/klimtlte
# repopick -g https://review.exynos5420.com 7796 # [DNM]: klimtlte: fake recovery size for now

# device/samsung/universal5420-common
# repopick -g https://review.exynos5420.com 7783 # [DNM] universal5420: dont build touch hal for now

# device/samsung/universal8890-common
# repopick 320439 # universal8890: Update clearkey plugin to drm HAL v1.4
# repopick 320440 # universal8890: explicitly build RIL HIDL dependencies
# repopick 320441 # universal8890: sepolicy: Attach vendor_property_type to properties
# repopick 320442 # universal8890: Set manufacturer and soc properties
# repopick 320443 # universal8890: uprev fingerprint HAL to v2.3
# repopick 320444 # universal8890: switch to new AIDL light HAL
# repopick 320446 # universal8890: Uprev audio HAL to V7
# repopick 320447 # universal8890: switch to new AIDL vibrator HAL
# repopick 320448 # universal8890: Disable the usage of ConfigStore.
# repopick 320449 # universal8890: Remove odex/oat files from pinner list.
# repopick 320450 # universal8890: Update SurfaceFlinger pin
# repopick 320451 # universal8890: move to ueventd to $(TARGET_OUT_VENDOR_ETC)
# repopick 320452 # universal8890: Don't pin camera app in memory
# repopick 320453 # universal8890: init: fix libinit compilation
# repopick 320454 # universal8890: sepolicy: drop sysfs_block
# repopick 320455 # universal8890: Rename exported3_radio_prop to radio_control_prop
# repopick 320655 # universal8890: Set BPF support level
# repopick 321059 # universal8890: split vendor and system properties
# repopick 321321 # universal8890: Switch to opensource secril_config_svc
# repopick 321322 # universal8890: Remove obsolete debug.sf.disable_backpressure property
# repopick 321323 # universal889: sepolicy: dont audit neuralnetwork hal wanting to access /data/data
# repopick 321324 # universal8890: sepolicy: dont audit lhd wanting to access /data/data
# repopick 321325 # universal8890: sepolicy: dont audit gpsd wanting to access /data/data
# repopick 321326 # universal8890: sepolicy: define sysfs_io_sched_tuneable
# repopick 321327 # sepolicy: label few props
# repopick 321328 # universal8890: add BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES
# repopick 321329 # universal8890: ignore neverallows
# repopick 320456 # Revert "Revert "universal8890: add common BSP flags""
# repopick 320457 # Revert "Revert "universal8890: Add gralloc header""
# repopick 320458 # Revert "Revert "universal8890: Update gralloc header""
# repopick 320459 # Revert "Revert "universal8890: update gralloc header for R""
# repopick 320460 # Revert "Revert "universal8890: build hwcomposer and memtrack hals from source""
# repopick 320461 # Revert "Revert "universal8890: support for building without the BSP""
# repopick 320462 # TEMP: universal8890: common bring up hacks

# kernel/samsung/exynos5420
# repopick -g https://review.exynos5420.com 8392 # klimtlte: Kill all possible debugging
# repopick -g https://review.exynos5420.com 7888 # klimtlte: build enforcing kernel by default

# kernel/samsung/universal8890
# repopick 320466 # arch/arm64: configs: disable CONFIG_RT_GROUP_SCHED

# device/lineage/sepolicy
repopick 330087 # sepolicy: add super fast charge interface

# device/samsung_slsi/sepolicy
repopick 330092 # sepolicy: add policy for super fast charge

# -------------- PLATFORM STUFF --------------

# build/soong
repopick 320142 # Add dumpvars for WITH_EXYNOS_BSP

# frameworks/base
repopick 332891 # SystemUI: VolumeDialogImpl: Show output button if there is an active stream
repopick 334527 # SystemUI: VolumeDialogImpl: Move the MediaOutputDialog above status bar
repopick 334590 # SystemUI: VolumeDialogImpl: notifyVisible after the volume panel is fully hidden
repopick 334591 # SystemUI: VolumeDialogImpl: Change bg tint for inactive rows
repopick 331626 # Make ringtone/notification volume steps configurable
repopick 331627 # SystemUI: Apply monet to fingerprint authentication ripple animation
repopick 331628 # styles: Use user fonts for Material UI themes
repopick 334635 # Partially revert "Wake up to lock screen when bouncer is visible"
repopick 333577 # Keyguard: Allow user configurable fingerprint wake-and-unlock
repopick 334005 # SystemUI: Redo circle battery style
repopick 334388 # SystemUI: Fix QS header clock color
repopick 334281 # SystemUI: Fix QS mobile icon disappearing on theme switch
repopick 333509 # Wallpaper: Make ImageWallpaper zooming tunable
repopick 328270 # fixup! Implement backup/restore for network policy
repopick 328271 # Add custom handling for backup/restore of UIDS_ALLOWED_ON_RESTRICTED_NETWORKS
repopick 320714 # SystemUI: add burnIn protection
repopick -f 329229 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f 329230 # keystore: Block key attestation for SafetyNet

# frameworks/opt/telephony
repopick 334823 # telephony: Disable handling audio direction changes on IMS calls.

# hardware/lineage/interfaces
repopick 330085 # fastcharge: add super fast charge support

# hardware/samsung
repopick 330095 # fastcharge: move 1.0 impl to separate folder
repopick 330096 # hidl: fastcharge: add 1.1 impl

# lineage-sdk
repopick 327684 # lineage: res: Introduce config to disable biometrics success haptic feedback
repopick 333507 # sdk: Add wallpaper zooming setting
repopick 327685 # lineage-sdk: Add preference keys for biometrics success haptic feedback
repopick 334822 # telephony: Add config to control handling of audio direction changes.

# packages/apps/LineageParts
repopick 335421 # LineageParts: Rewrite ButtonSettings to support feature exclusion
repopick 335422 # LineageParts: Buttons: Disable split screen option ...

# packages/apps/Settings
repopick 333578 # Settings: Allow user configurable fingerprint wake-and-unlock
repopick 332673 # Settings: Protect sensitive data on the about phone
repopick 333508 # Settings: Add preference for toggling the wallpaper zooming animation
repopick 330083 # Settings: add super fast charge toggle

# packages/apps/Trebuchet
repopick 335411 # Trebuchet: Don't show split screen options ...

# packages/modules/Permission
repopick 317973 -P packages/modules/Permission # PermissionController: Show up to 7 days of permission usage history

# system/bpf
repopick 320591 -f -P system/bpf # Ignore bpf errors for < 4.9 kernels

# system/netd
repopick 320592 -f -P system/netd # Ignore netd errors for < 4.9 kernels

# vendor/lineage
repopick 317982 # device_config: Keep up to 7 days of permission usage history
repopick -f 318087 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 318088 # adb insecure by default

exit 0
