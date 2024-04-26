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

# device/samsung_slsi/sepolicy
repopick 390379 # common: Allow apps to read cpu temperature
repopick 390380 # common: Label usb gadget HAL
repopick 390381 # common: Drop dtbo_block_device type
repopick 390382 # sepolicy: Add policy for cass and vaultkeeperd
repopick 390383 # common: Add policy for sehradiomanager
repopick 390384 # common: Label AIDL RIL interfaces
repopick 390385 # common: Allow sehradiomanager to find AIDL ISehRadioNetwork
repopick 390386 # common: Label HIDL RIL interfaces
# repopick 357508 # sepolicy: add policy for super fast charge

# device/lineage/sepolicy
# repopick 357348 # sepolicy: add policy for super fast charge

# -------------- PLATFORM STUFF --------------

# build
repopick -f 369796 # Sorry bro: 6 -> 3

# frameworks/base
repopick -f -P frameworks/base 385457 # base: Initial SenseProvider for FaceSense service
repopick -f -P frameworks/base 385458 # SystemUI: Use simple check for isFaceDisabled
repopick -f -P frameworks/base 385459 # SystemUI: Reset face auth on occluding app when authenticated
repopick -f -P frameworks/base 385460 # WalletActivity: Don't explicity request face auth
repopick -f -P frameworks/base 385461 # KeyguardBouncer: Don't delay showing if face auth running
repopick -f -P frameworks/base 385462 # FaceSense: Vibrate on successful authentication
repopick -f -P frameworks/base 385463 # SystemUI: Implement face unlock recognition animation and text
repopick -f -P frameworks/base 385464 # SystemUI: Use proper tint for face unlock icon
repopick -f -P frameworks/base 385465 # SystemUI: Implement bouncer face unlock animation
repopick -f -P frameworks/base 385466 # SystemUI: Fix face unlock icon visibility when auth fails
repopick -f -P frameworks/base 385467 # SystemUI: Avoid NullPointerException in setKeyguardMessage for face unlock message
repopick -f -P frameworks/base 385468 # SystemUI: FaceUnlock: Add margin based on lock icon
repopick -f -P frameworks/base 385489 # SystemUI: Enable pulsing animation for faceunlock
repopick -f -P frameworks/base 385490 # SystemUI: Avoid showing face unlock animation on AOD and ambient screen
repopick -f -P frameworks/base 385491 # SystemUI: Cleanup face unlock icon animation
repopick -f -P frameworks/base 385492 # fixup! SystemUI: Show face icon in lockscreen if faceunlock is enabled
repopick -f -P frameworks/base 385512 # BiometricScheduler: Cancel operation if not idle
repopick -f -P frameworks/base 381475 # SystemUI: More notification icons on AOD screen
repopick -f -P frameworks/base 383057 # wm: Optimize window/transition animation scaling
repopick -f -P frameworks/base 385497 # Introduce PixelPropsUtils for safety net spoof [SQUASHED]
repopick -f -P frameworks/base 385498 # PixelPropsUtils: Fix up compilation
repopick -f -P frameworks/base 385499 # PixelPropsUtils: Update Spoof fingerprint (#1078)
repopick -f -P frameworks/base 385500 # PixelPropsUtils: Update spoof packages
# repopick -f -P frameworks/base 369786 # Alter model name to avoid SafetyNet HW attestation enforcement
# repopick -f -P frameworks/base 369787 # keystore: Block key attestation for SafetyNet
# repopick -f -P frameworks/base 369788 # AttestationHooks: Set shipping level to 32 for devices >=33
# repopick -f -P frameworks/base 369789 # Limit SafetyNet workarounds to unstable GMS process
# repopick -f -P frameworks/base 369790 # gmscompat: Apply the SafetyNet workaround to Play Store aswell
# repopick -f -P frameworks/base 369791 # gmscompat: Use Nexus 6P fingerprint for CTS/Integrity
# repopick -f -P frameworks/base 369792 # gmscompat: Make CTS/Play Integrity pass again
# repopick -f -P frameworks/base 374392 # gmscompat: Use new info
# repopick -f -P frameworks/base 357510 # gmscompat: also spoof props for samsung/sec apps

# hardware/samsung_slsi-linaro/configs
repopick 382436 # BoardConfig9830: Switch to Vulkan UI renderer

# hardware/samsung_slsi-linaro/exynos
repopick 388285 # exynos: libaudio: Allow overriding low latency capture duration
repopick 388286 # exynos: audiohal: Set usage and device for voip quad mic
repopick 388287 # exynos: audiohal: Set device for camcorder quad mic
repopick 388288 # exynos: audiohal: Add QUAD_MIC device and stream definition
repopick 388289 # exynos: audiohal: When denying low latency capture ensure VOIP_TX flag is set

# hardware/samsung_slsi-linaro/graphics
repopick 388290 # hwc3: Add getOverlaySupport()
repopick 388291 # hwc3: Make the ComposerCommandEngine as local variable
repopick 388292 # hwc3: Primary displays supports MULTI_THREADED_PRESENT
repopick 388293 # hwc3: add display param to function traces and debug logs
repopick 388294 # Add HDR output control APIs implementation in hwc3
repopick 388295 # HWC: unify Android log tags
repopick 388296 # Update setHdrConversionStrategy to return the preferredHdrOutput type
repopick 388297 # [HWC3] native implementation for setRefreshRateChangedCallbackDebugEnabled
repopick 388298 # libhwc2.1: don't check SKIP_VALIDATE in HWC3
repopick 388299 # Update IComposer to V2
repopick 388300 # Remove references to MULTI_THREADED_PRESENT
repopick 388301 # libhwc2.1: enable thread safety analysis
repopick 388302 # libhwc2.1: enable thread safety analysis for libdrmresource
repopick 388303 # hwc3: call present again if no changes after validate
repopick 388304 # libhwc2.1: Address implicit capture of 'this' warnings
repopick 384848 # WIP: libhwc2.1: invalidate last frame before changing display mode

# hardware/samsung_slsi-linaro/interfaces

# hardware/lineage/interfaces
# repopick 357349 # fastcharge: add super fast charge support

# hardware/samsung
repopick 387911 # aidl: fingerprint: When force calibrating wait for sensor to become ready
repopick 387912 # aidl: fingerprint: Add support for libsfp_sensor
repopick 387913 # aidl: Import gs201 usb gadget HAL
repopick 387914 # aidl: usb: gadget: Rebrand to samsung
repopick 387915 # aidl: usb: gadget: Make gadget name configurable through soong
repopick 387916 # samsung: Introduce sehradiomanager
repopick 387917 # ril: sehradiomanager: Add support for a config file
repopick 387918 # ril: sehradiomanager: Add support for AIDL sehradio
repopick 387919 # aidl: ISehRadioNetworkIndication: Add missing function
repopick 390387 # ril: sehradiomanager: Restart when RILD died
# repopick 357350 # fastcharge: move 1.0 impl to separate folder
# repopick 357351 # hidl: fastcharge: add 1.1 impl

# packages/apps/Settings
repopick -f 385494 # Add Face Unlock with ParanoidSense
repopick -f 385495 # Settings: Import missing Face Unlock animation
# repopick 357352 # Settings: add super fast charge toggle

# packages/apps/Trebuchet
repopick -f 368923 # Launcher3: Show clear all button in recents overview

# system/core
repopick -f -P system/core 385501 # init: Set properties to make SafetyNet pass
repopick -f -P system/core 385502 # init: Weaken property override security for the init extension
repopick -f -P system/core 385503 # init: Add more properties to spoof.
repopick -f -P system/core 385504 # init: init: Do not set safety net props for ENG builds
repopick -f -P system/core 385505 # init: Spoof more props
# repopick -f 374048 # init: Set properties to make SafetyNet pass

# vendor/lineage
repopick -f 385496 # faceunlock
repopick -f -P vendor/lineage 369794 # lineage: Disable privapp permission enforcement (make it log)
repopick -f -P vendor/lineage 369795 # adb insecure by default

# repopick 357968 # config: add super fast charge interface

exit 0
