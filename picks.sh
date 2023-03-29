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
repopick 351271 # common: Add policy for hwc3
# repopick 330092 # sepolicy: add policy for super fast charge # To be pushed to 20

# -------------- PLATFORM STUFF --------------

# build
repopick -f 334342 # Sorry bro: 6 -> 3

# frameworks/base
repopick 350952 # SystemUI: Follow light/dark theme in SplitShade Header
repopick 351877 # Remove wtf if no display nits mapping exists
repopick 351878 # Adapt tuner prefs to S settings style & cleanup
repopick 351893 # fixup! Keyguard: Add option to scramble pin layout when unlocking (2/2).
repopick 351855 # core: Set config_displayLightSensorType to android.sensor.light
repopick 351858 # JobScheduler: Respect allow-in-power-save perm
repopick 351262 # Camera: Expose aux camera if packagename is null
repopick 349283 # PhoneWindowManager: Fix wakeup and long-press actions of assistant key
# repopick 340916 # SystemUI: add burnIn protection
repopick -f 334343 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f 334344 # keystore: Block key attestation for SafetyNet

# hardware/lineage/interfaces
# repopick 330085 # fastcharge: add super fast charge support # To be pushed to 20

# hardware/samsung
repopick 351016 # aidl: vibrator: Only handle actually supported effects
repopick 351017 # aidl: vibrator: Add click and tick duration config properties
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
repopick 351331 # overlay: Disable immersive mode confirmation
repopick -f 334345 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 334346 # adb insecure by default

exit 0
