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
repopick 319293 # Reenable camera allow- and excludelist property labels
repopick 319592 # Reenable persist.vendor.recovery_update
repopick 322576 # common: Label IUdfpsSensor
repopick 321910 # sepolicy: Drop Lineage performance policy

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

# device/samsung/herolte
repopick 320464 # herolte: remove liboemcrypto
repopick 320463 # herolte: init: fix include path

# device/samsung/hero2lte
repopick 319222 # hero2lte: remove liboemcrypto
repopick 320465 # hero2lte: init: fix include path

# device/samsung/klimt-common
# repopick -g https://review.exynos5420.com 7791 # [DNM] klimt: remove touch hal for now

# device/samsung/klimtlte
# repopick -g https://review.exynos5420.com 7796 # [DNM]: klimtlte: fake recovery size for now

# device/samsung/universal5420-common
# repopick -g https://review.exynos5420.com 7783 # [DNM] universal5420: dont build touch hal for now

# device/samsung/universal8890-common
repopick 320439 # universal8890: Update clearkey plugin to drm HAL v1.4
repopick 320440 # universal8890: explicitly build RIL HIDL dependencies
repopick 320441 # universal8890: sepolicy: Attach vendor_property_type to properties
repopick 320442 # universal8890: Set manufacturer and soc properties
repopick 320443 # universal8890: uprev fingerprint HAL to v2.3
repopick 320444 # universal8890: switch to new AIDL light HAL
repopick 320446 # universal8890: Uprev audio HAL to V7
repopick 320447 # universal8890: switch to new AIDL vibrator HAL
repopick 320448 # universal8890: Disable the usage of ConfigStore.
repopick 320449 # universal8890: Remove odex/oat files from pinner list.
repopick 320450 # universal8890: Update SurfaceFlinger pin
repopick 320451 # universal8890: move to ueventd to $(TARGET_OUT_VENDOR_ETC)
repopick 320452 # universal8890: Don't pin camera app in memory
repopick 320453 # universal8890: init: fix libinit compilation
repopick 320454 # universal8890: sepolicy: drop sysfs_block
repopick 320455 # universal8890: Rename exported3_radio_prop to radio_control_prop
repopick 320655 # universal8890: Set BPF support level
repopick 321059 # universal8890: split vendor and system properties
repopick 321321 # universal8890: Switch to opensource secril_config_svc
repopick 321322 # universal8890: Remove obsolete debug.sf.disable_backpressure property
repopick 321323 # universal889: sepolicy: dont audit neuralnetwork hal wanting to access /data/data
repopick 321324 # universal8890: sepolicy: dont audit lhd wanting to access /data/data
repopick 321325 # universal8890: sepolicy: dont audit gpsd wanting to access /data/data
repopick 321326 # universal8890: sepolicy: define sysfs_io_sched_tuneable
repopick 321327 # sepolicy: label few props
repopick 321328 # universal8890: add BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES
repopick 321329 # universal8890: ignore neverallows
repopick 320456 # Revert "Revert "universal8890: add common BSP flags""
repopick 320457 # Revert "Revert "universal8890: Add gralloc header""
repopick 320458 # Revert "Revert "universal8890: Update gralloc header""
repopick 320459 # Revert "Revert "universal8890: update gralloc header for R""
repopick 320460 # Revert "Revert "universal8890: build hwcomposer and memtrack hals from source""
repopick 320461 # Revert "Revert "universal8890: support for building without the BSP""
repopick 320462 # TEMP: universal8890: common bring up hacks

# kernel/samsung/exynos5420
# repopick -g https://review.exynos5420.com 8392 # klimtlte: Kill all possible debugging
# repopick -g https://review.exynos5420.com 7888 # klimtlte: build enforcing kernel by default

# kernel/samsung/universal8890
repopick 320466 # arch/arm64: configs: disable CONFIG_RT_GROUP_SCHED

# -------------- PLATFORM STUFF --------------

# art
repopick 318097 -P art # art: Conditionally remove version check for memfd_create()

# build

# build/make
repopick -f 318081 # Sorry bro: 6 -> 3

# build/soong
repopick 320142 # Add dumpvars for WITH_EXYNOS_BSP
repopick 317133 # soong: Add equivalent for LOCAL_EXPORT_CFLAGS

# frameworks/base
repopick 320839 # PhoneWindowManager: add LineageButtons volumekey hook
repopick 320840 # Long-press power while display is off for torch
repopick 320841 # Reimplement hardware keys custom rebinding
repopick 320842 # Reimplement device hardware wake keys support
repopick 320843 # PhoneWindowManager: Tap volume buttons to answer call
repopick 320844 # PhoneWindowManager: Implement press home to answer call
repopick 320845 # fw/b: Allow customisation of navbar app switch long press action
repopick 320846 # PhoneWindowManager: Allow torch and track skip during ambient display
repopick 320847 # fw/b torch: Let long press power turn torch off when screen is on.
repopick 320848 # Implement edge long swipe gesture [1/3]
repopick 317412 # SystemUI: add FloatingRotationButton for hw-key devices
repopick 321274 # SystemUI: don't show FRB when IME is visible
repopick 320849 # PhoneWindowManager: Add support for back key long press customization
repopick 320853 # Don't pass repeated back key events to app if custom action is set up
repopick 320850 # PhoneWindowManager: Forward port long press back to kill app
repopick 320851 # Use custom flag for edge long swipe gesture
repopick 320856 # Forward port 'Swap volume buttons' (1/3)
repopick 320857 # Camera button support
repopick 320860 # Add support for runtime toggle of navbar
repopick 320896 # fw/b: Button backlight brightness
repopick 320897 # PowerManagerService: Allow to light up buttons only when pressed
repopick 320898 # PowerManager: Allow to distinguish different keypresses
repopick 320904 # fwb: Re-introduce keyboard backlight brightness control
repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 321056 # frameworks: Power menu customizations
repopick 321167 # Zygote: Fix an issue when empty the usap pool.
repopick 321292 # Use flow layout for advanced power menu aswell
repopick 320947 # SystemUI: Port statusbar brightness control
repopick 317800 # Udfps: Make pressed udfp view configurable
repopick 317799 # udfps: Implement UdfpsHbmProvider
repopick 317801 # udfps: change window type to TYPE_DISPLAY_OVERLAY
repopick 317802 # udfps: Allow to configure hbm overlay type
repopick 317803 # udfps: Add support for udfps on aod without having dedicated sensor
repopick 317943 # UdfpsController: Call onFingerDown on action down events
repopick 321160 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 320714 # SystemUI: add burnIn protection
repopick 317786 # monet: Add support for monet (cam16)
repopick 322825 # Add CHANNEL_MODE_DUAL_CHANNEL constant
repopick 322826 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
repopick 322827 # Allow SBC as HD audio codec in Bluetooth device configuration
repopick 322828 # Explicitly make SBC Dual Channel an optional (HD) codec

# frameworks/native
repopick 320855 # Forward port 'Swap volume buttons' (2/3)
repopick 320894 # PowerManager.h: Define USER_ACTIVITY_FLAG values
repopick 320895 # InputDispatcher: On keypress, deliver keycode to pokeUserActivity
repopick 317924 # surfaceflinger: Add support for Udfps extension lib
repopick 317944 # CompositionEngine: Request device composition for the Udfps touched layer

# hardware/samsung
repopick 320716 # AdvancedDisplay: Adapt to S style
repopick 322464 # AdvancedDisplay: Add exported flags in manifest
repopick -f 304029 # samsung: doze: add standard pickup sensor support
repopick 322878 # fingerprint: Revert "fpc: keep fpc in system-background"
repopick 320717 # audio: remove AUDIO_DEVICE_OUT_ALL_SCO from switch case
repopick 321319 # audio: add LOCAL_VENDOR_MODULE
repopick 323525 # aidl: vibrator: properly implement effects

# lineage-sdk
repopick 320854 # sdk: Move app killed toast message to main application thread

# packages/apps/Bluetooth
repopick 322838 # SBC Dual Channel (SBC HD Audio) support

# packages/apps/Settings
repopick 321051 # Settings: Add advanced restart switch
repopick 322833 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
repopick 320774 # Settings: Fix hardcoded black text in storage summary
repopick 320776 # Settings: Drop custom preferenceFragmentCompatStyle
repopick 320779 # Settings: use framework text colors for SwitchBar

# packages/modules/Permission
repopick 317972 -P packages/modules/Permission # PermissionController: Enable usage timeline for all permission groups
repopick 317973 -P packages/modules/Permission # PermissionController: Show up to 7 days of permission usage history

# system/bpf
repopick 320591 -P system/bpf # Ignore bpf errors for < 4.9 kernels

# system/bt
repopick 322834 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
repopick 322835 # Explicit SBC Dual Channel (SBC HD) support
repopick 322836 # Allow using alternative (higher) SBC HD bitrates with a property

# system/netd
repopick 320592 -P system/netd # Ignore netd errors for < 4.9 kernels

## vendor/lineage
repopick 318283 # overlay: core: Remove accent color overrides
repopick 317788 # overlay: Enable monet
repopick 317981 # device_config: Save discrete app op history for more permissions
repopick 317982 # device_config: Keep up to 7 days of permission usage history
repopick -f 318087 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 318088 # adb insecure by default
repopick -f 318084 # lineage: Moar fontz
repopick -f 318085 # lineage: Update default wallpaper for 19.0

exit 0
