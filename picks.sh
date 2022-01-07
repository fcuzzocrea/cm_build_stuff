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
repopick 319592 # Reenable persist.vendor.recovery_update

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
repopick 320441 # universal8890: sepolicy: Attach vendor_property_type to properties
repopick 320442 # universal8890: Set manufacturer and soc properties
repopick 320443 # universal8890: uprev fingerprint HAL to v2.3
repopick 320444 # universal8890: switch to new AIDL light HAL
repopick 320445 # universal8890: Remove vendor RenderScript implementation.
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
repopici 321322 # universal8890: Remove obsolete debug.sf.disable_backpressure property
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
repopick 320467 # temp: common bring up hacks

# -------------- PLATFORM STUFF --------------

# art
repopick 318097 -P art # art: Conditionally remove version check for memfd_create()

# build
repopick 317298 # Add BOARD_CUSTOM_BOOTIMG_MK support
repopick 317300 # build: Add support for device tree in boot.img

# build/make
repopick -f 318081 # Sorry bro: 6 -> 3

# build/soong
repopick 320142 # Add dumpvars for WITH_EXYNOS_BSP
repopick 317133 # soong: Add equivalent for LOCAL_EXPORT_CFLAGS

# device/samsung_slsi/sepolicy
repopick 319362 # sepolicy: Switch to SYSTEM_EXT_{PUBLIC,PRIVATE}_SEPOLICY_DIRS
repopick 319363 # common: Update radio prop context
repopick 319364 # Revert "common: Label ro.gfx.driver.1 propertiy"
repopick 319405 # Attach vendor_property_type to properties
repopick 321317 # mobicore: legacy: do now allow tee to set system_prop
repopick 319376 # common: remove ro.build.PDA prop
repopick 319378 # common: drop properties with invalid vendor namespace
repopick 319379 # common: label new AIDL light HAL
repopick 319380 # common: label new AIDL vibrator HAL
repopick 321318 # fastchage: allow connecto permission

# frameworks/base
repopick 320838 # Allow lid to send a generic COVER_CHANGED broadcast
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
repopick 320849 # PhoneWindowManager: Add support for back key long press customization
repopick 320853 # Don't pass repeated back key events to app if custom action is set up
repopick 320850 # PhoneWindowManager: Forward port long press back to kill app
repopick 320851 # Use custom flag for edge long swipe gesture
repopick 320856 # Forward port 'Swap volume buttons' (1/3)
repopick 320857 # Camera button support
repopick 320928 # SystemUI: handle camera launch gesture from keyhandler
repopick 320860 # Add support for runtime toggle of navbar
repopick 320896 # fw/b: Button backlight brightness
repopick 320897 # PowerManagerService: Allow to light up buttons only when pressed
repopick 320898 # PowerManager: Allow to distinguish different keypresses
repopick 320904 # fwb: Re-introduce keyboard backlight brightness control
repopick 320903 # PowerManager: Add proximity check on wake
repopick 320923 # SystemUI: Add quick settings pull down with one finger
repopick 320924 # SystemUI: Add double tap to sleep gesture
repopick 320925 # SystemUI: use DOUBLE_TAP_TO_WAKE setting also for wake from aod
repopick 320930 # frameworks/base: Battery and Notification Lights
repopick 320931 # frameworks/base: Lights notifications brightness support
repopick 320933 # SystemUI: Add visualizer feature
repopick 320935 # SystemUI: Allow to enable Lockscreen Media Art [1/3]
repopick 320936 # SystemUI: Hide lockscreen media art if media is not playing
repopick 320940 # Add an option to force pre-O apps to use full screen aspect ratio
repopick 320945 # PowerManagerService: Wake on plug (1/2)
repopick 320953 # Support enforcing a minimum delay between notification sounds of an app.
repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 321056 # frameworks: Power menu customizations
repopick 321292 # Use flow layout for advanced power menu aswell
repopick 320947 # SystemUI: Port statusbar brightness control
repopick 321160 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 320714 # SystemUI: add burnIn protection
repopick 320765 # SystemUI: Fix shutter sound
repopick 317786 # monet: Add support for monet (cam16)
repopick 318458 # SystemUI: Use AVCProfileMain for screen recorder
repopick 318459 # Fix bug Device that can't support adoptable storage cannot read the sdcard.

# frameworks/native
repopick 320855 # Forward port 'Swap volume buttons' (2/3)
repopick 320894 # PowerManager.h: Define USER_ACTIVITY_FLAG values
repopick 320895 # InputDispatcher: On keypress, deliver keycode to pokeUserActivity

# hardware/samsung
repopick 318107 # Specify version for aidl_interface explicitly
repopick 318109 # NO, Thank You!
repopick 288286 # thermal: Remove static vndk dep from vendor modules
repopick 319371 # [thermal] Use new jsoncpp API
repopick 319372 # hidl: fingerprint: Uprev to 2.3
repopick 319373 # samsung: light: convert to AIDL implementation
repopick 319374 # samsung: vibrator: convert to AIDL implementation
repopick 319375 # aidl: vibrator: improve amplitude values
repopick 319622 # fingerprint: implement ss_fingerprint_request
repopick 319623 # fingerprint: implement gestures
repopick 319921 # samsung: add secril_config_svc
repopick 319360 # mkbootimg: Update for S
repopick 319399 # doze: Adapt to S style
repopick 320716 # AdvancedDisplay: Adapt to S style
repopick 320717 # audio: remove AUDIO_DEVICE_OUT_ALL_SCO from switch case
repopick 321319 # audio: add LOCAL_VENDOR_MODULE

# lineage-sdk
repopick 320854 # sdk: Move app killed toast message to main application thread

# packages/apps/Settings
repopick 320906 # Settings: Add proximity check on wake preference
repopick 320922 # Settings: Add double tap to sleep preference
repopick 320926 # Settings: gesture: Add LineageParts touchscreen gesture settings
repopick 320927 # Settings: Allow devices to provide remote gesture preferences
repopick 320929 # Settings: Add back battery and notification lights settings
repopick 320932 # Settings: Add lockscreen visualizer toggle
repopick 320937 # Settings: Add toggle for Lockscreen Media Art [2/3]
repopick 320941 # Settings: Add an option to force pre-O apps to use full screen aspect ratio
repopick 320946 # Settings: display: Add wake on plug switch
repopick 320952 # Settings: Add setup UI for minimum delay between an app's notification sounds
repopick 321051 # Settings: Add advanced restart switch
repopick 321038 # Settings: Add back increasing ring feature (2/2).
repopick 320774 # Settings: Fix hardcoded black text in storage summary
repopick 320776 # Settings: Drop custom preferenceFragmentCompatStyle
repopick 320779 # Settings: use framework text colors for SwitchBar

# packages/apps/ThemePicker
repopick -f 317574 # ThemePicker: Grant missing wallpaper permissions

# packages/modules/common
repopick 320751 -P packages/modules/common # Make adbroot_aidl_interface-ndk_platform available for adbd

# packages/modules/Permission
repopick 317972 -P packages/modules/Permission # PermissionController: Enable usage timeline for all permission groups
repopick 317973 -P packages/modules/Permission # PermissionController: Show up to 7 days of permission usage history

# system/bpf
repopick 320591 -P system/bpf # Ignore bpf errors for < 4.9 kernels

# system/netd
repopick 320592 -P system/netd # Ignore netd errors for < 4.9 kernels

# system/tools/mkbootimg
repopick 319780 -P system/tools/mkbootimg # mkbootimg: add support for --dt

## vendor/lineage
repopick 318283 # overlay: core: Remove accent color overrides
repopick 317788 # overlay: Enable monet
repopick 317981 # device_config: Save discrete app op history for more permissions
repopick 317982 # device_config: Keep up to 7 days of permission usage history
repopick -f 318084 # lineage: Moar fontz
repopick -f 318085 # lineage: Update default wallpaper for 19.0

# -------------- TOPIC STUFF --------------
# still needs to be ported
# repopick -t eleven-fastcharge

exit 0
