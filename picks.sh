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
# repopick 330087 # sepolicy: add super fast charge interface # To be pushed to 20

# device/samsung_slsi/sepolicy
# repopick 330092 # sepolicy: add policy for super fast charge # To be pushed to 20

# -------------- PLATFORM STUFF --------------

# build
repopick 334342 # Sorry bro: 6 -> 3

# build/soong
# repopick 320142 # Add dumpvars for WITH_EXYNOS_BSP # To be pushed to 20

# frameworks/base
repopick 340916 # SystemUI: add burnIn protection
repopick -f 334343 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f 334344 # keystore: Block key attestation for SafetyNet

# hardware/lineage/interfaces
# repopick 330085 # fastcharge: add super fast charge support # To be pushed to 20

# hardware/samsung
# repopick 330095 # fastcharge: move 1.0 impl to separate folder # To be pushed to 20
# repopick 330096 # hidl: fastcharge: add 1.1 impl # To be pushed to 20

# lineage-sdk

# packages/apps/LineageParts

# packages/apps/Settings
# repopick 330083 # Settings: add super fast charge toggle # To be pushed to 20

# packages/apps/Trebuchet

# system/core
repopick -f 334348 # init: Set properties to make SafetyNet pass

# vendor/lineage
repopick -f 334345 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 334346 # adb insecure by default

exit 0
