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

# -------------- PLATFORM STUFF --------------

# bootable/recovery
repopick 322986 # recovery: Add logcat to deps

# build/soong
repopick 320142 # Add dumpvars for WITH_EXYNOS_BSP

# external/libncurses
repopick 322932 # libncurses: Convert to Android.bp
repopick 322933 # libncurses: Mark as recovery_available

# external/nano
repopick 323228 # nano: Move to Android.bp
repopick 323229 # nano: Add support for recovery

# frameworks/base
repopick 326160 # frameworks: Exempt location packages from location indicators
repopick 326990 # SystemUI: Move KEY_NAVIGATION_HINT handling to NavigationBarController
repopick 326160 # frameworks: Exempt location packages from location indicators
repopick 324734 # Biometrics: Allow disabling of fingerprint cleanups
repopick 320714 # SystemUI: add burnIn protection
repopick 322825 # Add CHANNEL_MODE_DUAL_CHANNEL constant
repopick 322826 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
repopick 322827 # Allow SBC as HD audio codec in Bluetooth device configuration
repopick 322828 # Explicitly make SBC Dual Channel an optional (HD) codec

# hardware/samsung
repopick 320717 # audio: remove AUDIO_DEVICE_OUT_ALL_SCO from switch case
repopick 321319 # audio: add LOCAL_VENDOR_MODULE
repopick 327003 # samsung: doze: add standard pickup sensor support

# lineage-sdk
repopick 327684 # lineage: res: Introduce config to disable biometrics success haptic feedback
repopick 327685 # lineage-sdk: Add preference keys for biometrics success haptic feedback
# packages/apps/Bluetooth
repopick 322838 # SBC Dual Channel (SBC HD Audio) support

# packages/apps/LineageParts
repopick 325368 # PowerMenuActions: Minor clean up

# packages/apps/Seedvault
repopick 321755 # RestoreFiles: Use RESULT_SKIP when skipping
repopick 321756 # Import and convert SettingsLib.Utils.getColorAccent
repopick 321757 # Add setupcompat and setupdesign deps
repopick 321758 # Switch to RESULT_SKIP from setupcompat library
repopick 318008 # Seedvault: redesign SUW activities

# packages/apps/Settings
repopick 322833 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu

# packages/apps/Trebuchet
repopick 317969 # Expose themed icon setting in ThemePicker
repopick 317967 # Enable crossfade when changing theme
repopick 318383 # Enable local colors for popup menu items
repopick 326714 # NavbarButtonsViewController: Support navbar layout inversion
repopick 326988 # Trebuchet: Assume taskbar is disabled if its size is equal 0
repopick 326714 # NavbarButtonsViewController: Support navbar layout inversion

# packages/modules/Permission
repopick 317972 -P packages/modules/Permission # PermissionController: Enable usage timeline for all permission groups
repopick 317973 -P packages/modules/Permission # PermissionController: Show up to 7 days of permission usage history

# packages/overlays/Lineage
repopick 326989 # NavigationBarNoHint: Set taskbar_frame_height to 0dp

# system/bpf
repopick 320591 -f -P system/bpf # Ignore bpf errors for < 4.9 kernels

# system/bt
repopick 322834 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
repopick 322835 # Explicit SBC Dual Channel (SBC HD) support
repopick 322836 # Allow using alternative (higher) SBC HD bitrates with a property

# system/core
repopick 317912 # init: Don't run update_sys_usb_config if /data isn't mounted

# system/logging
repopick 322985 # logcat: Mark as recovery_available

# system/netd
repopick 320592 -f -P system/netd # Ignore netd errors for < 4.9 kernels

## vendor/lineage
repopick 322935 # config: common: Build nano in recovery
repopick 317981 # device_config: Save discrete app op history for more permissions
repopick 317982 # device_config: Keep up to 7 days of permission usage history
repopick -f 318087 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 318088 # adb insecure by default

exit 0
