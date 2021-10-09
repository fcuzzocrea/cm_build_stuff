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

# kernel/samsung/exynos5420
repopick -g https://review.exynos5420.com 7888 # klimtlte: build enforcing kernel by default

# -------------- PLATFORM STUFF --------------
# frameworks/base
repopick 316830 # KeyStore: Block key attestation for Google Play Services

## vendor/lineage
repopick -f 275679 # lineage: Moar fontz
repopick -f 266142 # lineage: Update default wallpaper for 17.1


exit 0
