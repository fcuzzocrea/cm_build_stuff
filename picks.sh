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
repopick 357348 # sepolicy: add policy for super fast charge

# -------------- PLATFORM STUFF --------------

# build
repopick -f 334342 # Sorry bro: 6 -> 3

# frameworks/base
repopick 340916 # SystemUI: add burnIn protection
repopick -f 334343 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f 334344 # keystore: Block key attestation for SafetyNet

# hardware/lineage/interfaces
repopick 357349 # fastcharge: add super fast charge support

# hardware/samsung
repopick 357350 # fastcharge: move 1.0 impl to separate folder
repopick 357351 # hidl: fastcharge: add 1.1 impl

# packages/apps/Settings
repopick 357352 # Settings: add super fast charge toggle

# system/core
repopick -f 334348 # init: Set properties to make SafetyNet pass

# vendor/lineage
repopick -f 334345 # lineage: Disable privapp permission enforcement (make it log)
repopick -f 334346 # adb insecure by default

exit 0
