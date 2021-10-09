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
repopick -f -P device/lineage/sepolicy 307258 # lineage: Kill policy incompatibily with GSI for some OEMs

# device/samsung/universal5420-common
repopick -g https://review.exynos5420.com 7783 # [DNM] universal5420: dont build touch hal for now

# device/samsung/klimt-common
repopick -g https://review.exynos5420.com 7791 # [DNM] klimt: remove touch hal for now

# device/samsung/klimtlte
repopick -g https://review.exynos5420.com 7796 # [DNM]: klimtlte: fake recovery size for now

# device/samsung/universal8890-common
repopick 302917 # Revert "Revert "universal8890: add common BSP flags""
repopick 302918 # Revert "Revert "universal8890: Add gralloc header""
repopick 302919 # Revert "Revert "universal8890: Update gralloc header""
repopick 302920 # Revert "Revert "universal8890: update gralloc header for R""
repopick 302921 # Revert "Revert "universal8890: build hwcomposer and memtrack hals from source""
repopick 302922 # Revert "Revert "universal8890: support for building without the BSP""

# kernel/samsung/exynos5420
repopick -g https://review.exynos5420.com 8392 # klimtlte: Kill all possible debugging
repopick -g https://review.exynos5420.com 7888 # klimtlte: build enforcing kernel by default

# -------------- PLATFORM STUFF --------------

# build/make
repopick 288657 # Sorry bro: 6 -> 3

# build/soong
repopick 311549 # Add dumpvars for WITH_EXYNOS_BSP

# frameworks/base
repopick 312889 #[1/3] SystemUI: add burnIn protection setting
repopick 310556 # KeyStore: Block key attestation for Google Play Services

# packages/app/LineageParts
repopick -f -P packages/app/LineageParts 316725 # Parts: add package for res

## vendor/lineage
repopick -f 289513 # lineage: Moar fontz
repopick -f 289514 # lineage: Update default wallpaper for 18.1

# -------------- TOPIC STUFF --------------

repopick -t eleven-firewall

exit 0
