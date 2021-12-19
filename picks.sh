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
#repopick 319222 # hero2lte: remove liboemcrypto
#repopick 320465 # hero2lte: init: fix include path

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
repopick 319376 # common: remove ro.build.PDA prop
repopick 319378 # common: drop properties with invalid vendor namespace
repopick 319379 # common: label new AIDL light HAL
repopick 319380 # common: label new AIDL vibrator HAL

# frameworks/av
repopick 317360 # Add AudioSessionInfo
repopick 320515 # Revert "stagefright: remove Miracast sender code"
repopick 320516 # Revert "Removed unused class and its test"
repopick 320517 # libstagefright: Remove libmediaextractor dependency
repopick 320518 # libstagefright_wfd: compilation fixes
repopick 320519 # stagefright: Fix SurfaceMediaSource getting handle from wrong position issue
repopick 320520 # stagefright: Fix buffer handle retrieval in signalBufferReturned
repopick 320521 # libstagefright_wfd: video encoder does not actually release MediaBufferBase when done
repopick 320522 # audioflinger: Fix audio for WifiDisplay
repopick 320523 # Partial revert "Move unused classes out of stagefright foundataion"

# frameworks/base
# Still needs to be ported
# repopick 312889 # [1/3] SystemUI: add burnIn protection setting
# repopick 295807 # Keyguard: Allow disabling fingerprint wake-and-unlock
# repopick 289193 # SystemUI: Allow overlaying max notification icons
repopick 318494 # Split network policy XML parsing into read/write helper functions
repopick 318495 # Implement backup/restore for network policy
repopick 318826 # SystemUI: Bring back good ol' circle battery style
repopick 318828 # QuickStatusBarHeader: don't disable estimate mode for centered notch devices
repopick 318819 # SystemUI: Add tunables for clock position
repopick 318820 # SystemUI: Add tunables for clock AM/PM style
repopick 318821 # SystemUI: Make clock truly invisible
repopick 318824 # SystemUI: Make center clock layout safe insets aware
repopick 318825 # SystemUI: Fix up right clock handling when showing heads up
repopick 318822 # SystemUI: fix clock dark/light mode switching
repopick 318804 # SystemUI: Add Lineage statusbar item holder
repopick 318805 # SystemUI: Network Traffic [1/3]
repopick 317786 # monet: Add support for monet (cam16)
repopick 318355 # SystemUI: Expose legacy Wi-Fi and cellular data QS tiles
repopick 318356 # SystemUI: Allow Wi-Fi/cell tiles to co-exist with provider model
repopick 320419 # Revert "[DO NOT MERGE] Make sure WiFi and Cell tiles are not created in Provider Model"
repopick 318458 # SystemUI: Use AVCProfileMain for screen recorder
repopick 318459 # Fix bug Device that can't support adoptable storage cannot read the sdcard.

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

# lineage-sdk
repopick 318514 # Enable Restricted Networking Mode and allowlist INTERNET apps by default

# packages/apps/Settings
repopick 319490 # Migrate from network isolation to restricted networking mode
repopick 318021 # Settings: default to GlifV3Theme
repopick 318022 # Settings: use Glif themed button bar
repopick 318023 # Settings: Network setup UI changes for SUW

# packages/apps/ThemePicker
repopick -f 317574 # ThemePicker: Grant missing wallpaper permissions

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
