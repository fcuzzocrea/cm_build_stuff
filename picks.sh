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
repopick 345753 # teegris: Label /dev/tziwshmem
# repopick 330087 # sepolicy: add super fast charge interface # To be pushed to 20

# device/samsung_slsi/sepolicy
repopick 351271 # common: Add policy for hwc3
# repopick 330092 # sepolicy: add policy for super fast charge # To be pushed to 20

# -------------- PLATFORM STUFF --------------

# build
repopick -f 334342 # Sorry bro: 6 -> 3

# build/soong
# repopick 320142 # Add dumpvars for WITH_EXYNOS_BSP # To be pushed to 20

# frameworks/base
repopick 347946 # SystemUI: Network traffic with center cutout [1/3]
repopick 350954 # SystemUI: Make edit button click ripple effect rounded
repopick 350953 # SystemUI: DreamTile: Enable for everyone
repopick 350952 # SystemUI: Follow light/dark theme in SplitShade Header
repopick 350951 # SystemUI: Show the alarm icon on QS as well
repopick 350286 # SystemUI: Bring in drawable for statusbar firewall toggle
repopick 350285 # Implement firewall status bar indicator

repopick 340916 # SystemUI: add burnIn protection
repopick -f 334343 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f 334344 # keystore: Block key attestation for SafetyNet

# hardware/lineage/interfaces
# repopick 330085 # fastcharge: add super fast charge support # To be pushed to 20

# hardware/samsung
# repopick 330095 # fastcharge: move 1.0 impl to separate folder # To be pushed to 20
# repopick 330096 # hidl: fastcharge: add 1.1 impl # To be pushed to 20

# lineage-sdk
repopick 347915 # Network traffic with center cutout [2/3]

# packages/apps/LineageParts
repopick 347916 # Network traffic with center cutout [3/3]

# packages/apps/Settings
# repopick 330083 # Settings: add super fast charge toggle # To be pushed to 20

# packages/apps/Trebuchet

# system/core
repopick -f 334348 # init: Set properties to make SafetyNet pass

# vendor/lineage
repopick 351331 # overlay: Disable immersive mode confirmation
repopick -f 334345 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 334346 # adb insecure by default

repopick -t charging-control-hal-20
exit 0
