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

# device/samsung/universal5420-common
# repopick -g https://review.exynos5420.com 7783 # [DNM] universal5420: dont build touch hal for now

# device/samsung/klimt-common
# repopick -g https://review.exynos5420.com 7791 # [DNM] klimt: remove touch hal for now

# device/samsung/klimtlte
# repopick -g https://review.exynos5420.com 7796 # [DNM]: klimtlte: fake recovery size for now

# device/samsung/universal8890-common
# repopick 302917 # Revert "Revert "universal8890: add common BSP flags""
# repopick 302918 # Revert "Revert "universal8890: Add gralloc header""
# repopick 302919 # Revert "Revert "universal8890: Update gralloc header""
# repopick 302920 # Revert "Revert "universal8890: update gralloc header for R""
# repopick 302921 # Revert "Revert "universal8890: build hwcomposer and memtrack hals from source""
# repopick 302922 # Revert "Revert "universal8890: support for building without the BSP""

# kernel/samsung/exynos5420
# repopick -g https://review.exynos5420.com 8392 # klimtlte: Kill all possible debugging
# repopick -g https://review.exynos5420.com 7888 # klimtlte: build enforcing kernel by default

# -------------- PLATFORM STUFF --------------

# bootable/recovery
# repopick 317881 # recovery: Allow custom bootloader msg offset in block misc
# repopick 317882 # recovery: wipe bootloader message from index 0 when using custom offsets

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

# frameworks/base
# Still needs to be ported
# repopick 312889 # [1/3] SystemUI: add burnIn protection setting
# repopick 295807 # Keyguard: Allow disabling fingerprint wake-and-unlock
# repopick 289193 # SystemUI: Allow overlaying max notification icons
repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 317978 # overlay: SystemUI: Enable combined signal icons in status bar
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
# repopick 317359 # lineage: audio: Maybe 1

# packages/apps/lineageparts
# repopick 317606 # LineageParts: Temporary hax

# packages/apps/themepicker
repopick -f 317574 # ThemePicker: Grant missing wallpaper permissions

# packages/apps/settings
# repopick 318091 # Settings: Add LineageOS legal info

# packages/apps/trebuchet
# checkchain 318747 # Trebuchet: fix all app search overlap

# system/tools/mkbootimg
repopick 319780 -P system/tools/mkbootimg/ # mkbootimg: add support for --dt

## vendor/lineage
repopick -f 318084 # lineage: Moar fontz
repopick -f 318085 # lineage: Update default wallpaper for 19.0

# -------------- TOPIC STUFF --------------
# repopick -t reduce-bdev-qdepth
# still needs to be ported
# repopick -t eleven-fastcharge

exit 0
