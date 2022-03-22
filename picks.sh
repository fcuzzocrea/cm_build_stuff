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

# device/lineage/sepolicy
repopick 322576 # common: Label IUdfpsSensor

# device/samsung_slsi/sepolicy
repopick 323075 # mobicore: label mcDriverDaemon
repopick 323077 # common: label lhd
repopick 323078 # common: label partitions for older models
repopick 323079 # common: label samsung GNSS HAL
repopick 323080 # common: label macloader
repopick 323081 # common: label gpsd
repopick 323310 # common: label widevine/clearkey DRM hals
repopick 323311 # common: label keymaster HAL
repopick 323312 # common: label graphics files
repopick 324733 # common: label NFC HAL

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

# build/make
repopick -f 318081 # Sorry bro: 6 -> 3

# build/soong
repopick 320142 # Add dumpvars for WITH_EXYNOS_BSP

# external/libncurses
repopick 322932 # libncurses: Convert to Android.bp
repopick 322933 # libncurses: Mark as recovery_available

# external/nano
repopick 323228 # nano: Move to Android.bp
repopick 323229 # nano: Add support for recovery

# external/setupcompat
repopick -P external/setupcompat 326705 # Add option to look at main app for Partner resources
repopick -P external/setupcompat 326706 # Enable DayNight and dynamic colors by default
repopick -P external/setupcompat 326707 # Import pixel setupwizard overlay resources

# frameworks/base
repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 323013 # VolumeDialog: Display default row when active row is notification
repopick 323014 # VolumeDialog: Don't hide the default stream when adjusting the music stream
repopick 323015 # VolumeDialog: Make the dialog expandable
repopick 326990 # SystemUI: Move KEY_NAVIGATION_HINT handling to NavigationBarController
repopick 326160 # frameworks: Exempt location packages from location indicators
repopick 321160 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 323992 # PackageManager: Allow build-time disabling of components
repopick 324734 # Biometrics: Allow disabling of fingerprint cleanups
repopick 320714 # SystemUI: add burnIn protection
repopick 322825 # Add CHANNEL_MODE_DUAL_CHANNEL constant
repopick 322826 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
repopick 322827 # Allow SBC as HD audio codec in Bluetooth device configuration
repopick 322828 # Explicitly make SBC Dual Channel an optional (HD) codec

# hardware/samsung
repopick 320717 # audio: remove AUDIO_DEVICE_OUT_ALL_SCO from switch case
repopick 321319 # audio: add LOCAL_VENDOR_MODULE
repopick 324857 # hidl: usb: Import gs101 USB HAL
repopick 324858 # hidl: usb: Remove UsbGadget HAL
repopick 324859 # hidl: usb: Remove overheat reporting
repopick 324860 # hidl: usb: Rebrand to samsung and adjust paths
repopick 323525 # aidl: vibrator: properly implement effects
repopick 327003 # samsung: doze: add standard pickup sensor support

# lineage-sdk
repopick 325903 # lineage-sdk: Remove NativeHelper class
repopick 325899 # res: Introduce config to allow build-time disabling of components

# packages/apps/Bluetooth
repopick 322838 # SBC Dual Channel (SBC HD Audio) support

# packages/apps/Settings
repopick 322884 # Settings: Add peak refresh rate list preference
repopick 322833 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu

# packages/apps/LineageParts
repopick 325368 # PowerMenuActions: Minor clean up

# packages/apps/SetupWizard
repopick 326875 # SUW: add page for navigation mode
repopick 325324 # SUW: Enable partner resources and switch to DayNight
repopick 325325 # SUW: Set button themes
repopick 325326 # SUW: Redesign Welcome page based on Pixel

# packages/apps/Dialer
repopick 324509 # Dialer: remove unused drawables
repopick 324510 # Dialer: Material You

# packages/apps/Messaging
repopick 324504 # Messaging: remove unused drawables
repopick 324505 # Messaging: Update checkmark PNG drawable with XML drawable
repopick 324404 # Messaging: use Material You colors

# packages/apps/Settings
repopick 327067 # Settings: Use display version for, well, displayed version
repopick 325928 # Settings: Apply SUW button theming to WiFi page
repopick 325897 # Settings: Support dark mode on 'Vision Settings'
repopick 327013 # Settings: Accessibility wants fullscreen, too!

# packages/apps/Trebuchet
repopick 326988 # Trebuchet: Assume taskbar is disabled if its size is equal 0
repopick 326714 # NavbarButtonsViewController: Support navbar layout inversion

# packages/inputmethods/LatinIME
repopick 325437 # LatinIME: remove unused drawables
repopick 325405 # LatinIME: fit more emoji in a page
repopick 325438 # LatinIME: show emoji key when language switch key is not shown
repopick 325748 # LatinIME: add attr for vertical hint padding
repopick 325406 # LatinIME: Initial You

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

# system/logging
repopick 322985 # logcat: Mark as recovery_available

# system/netd
repopick 320592 -f -P system/netd # Ignore netd errors for < 4.9 kernels

## vendor/lineage
repopick 327105 # overlay: Move config_globallyDisabledComponents to the new location
repopick 322935 # config: common: Build nano in recovery
repopick 326374 # device_config: Show setting to disable location indicators
repopick 317981 # device_config: Save discrete app op history for more permissions
repopick 317982 # device_config: Keep up to 7 days of permission usage history
repopick 325449 # overlay: Remove unused SystemUI overlays
repopick -f 318087 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 318088 # adb insecure by default
repopick -f 318084 # lineage: Moar fontz
repopick -f 318085 # lineage: Update default wallpaper for 19.0

exit 0
