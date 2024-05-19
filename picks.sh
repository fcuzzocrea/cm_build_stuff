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
repopick 390382 # sepolicy: Add policy for cass and vaultkeeperd
repopick 390383 # common: Add policy for sehradiomanager
repopick 390384 # common: Label AIDL RIL interfaces
repopick 390385 # common: Allow sehradiomanager to find AIDL ISehRadioNetwork
repopick 390386 # common: Label HIDL RIL interfaces
repopick 391062 # common: add sepolicy for rebalance_interrupts daemon
repopick 391063 # common: add sepolicy for slsi tetheroffload HAL
# repopick 357508 # sepolicy: add policy for super fast charge

# device/lineage/sepolicy
# repopick 357348 # sepolicy: add policy for super fast charge

# -------------- PLATFORM STUFF --------------

# build
repopick -f 369796 # Sorry bro: 6 -> 3

# frameworks/base
repopick -f -P frameworks/base 385457 # base: Initial SenseProvider for FaceSense service
repopick -f -P frameworks/base 385463 # SystemUI: Implement face unlock recognition animation and text
repopick -f -P frameworks/base 385464 # SystemUI: Use proper tint for face unlock icon
repopick -f -P frameworks/base 391097 # SystemUI: biometrics: Follow user setting to confirm face unlock
repopick -f -P frameworks/base 385512 # BiometricScheduler: Cancel operation if not idle
repopick -f -P frameworks/base 388204 # base: Add three-fingers-swipe to screenshot [1/2]
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
repopick 391064 # BoardConfig9830: Enable BSP audio HAL for Exynos9830
repopick 382436 # BoardConfig9830: Switch to Vulkan UI renderer

# hardware/samsung_slsi-linaro/exynos
repopick 388285 # exynos: libaudio: Allow overriding low latency capture duration
repopick 388286 # exynos: audiohal: Set usage and device for voip quad mic
repopick 388287 # exynos: audiohal: Set device for camcorder quad mic
repopick 388288 # exynos: audiohal: Add QUAD_MIC device and stream definition
repopick 388289 # exynos: audiohal: When denying low latency capture ensure VOIP_TX flag is set
repopick 391065 # exynos: audiohal_comv1: Re-import from Q BSP
repopick 391066 # exynos: audiohal_comv1: Fix compile error
repopick 391067 # exynos: audiohal_comv1: Add support for secril
repopick 391068 # exynos: audiohal_comv1: Adapt secril for audiohal_comv1
repopick 391069 # exynos: audiohal_comv1: Add missing device and stream definitions
repopick 391070 # exynos: audiohal_comv1: Allow overriding low latency capture duration
repopick 391071 # exynos: audiohal_comv1: Add QUAD_MIC device and stream definition
repopick 391072 # exynos: audiohal_comv1: Adapt call usages
repopick 391073 # exynos: audiohal_comv1: Add support for VOIP_TX input flag
repopick 391074 # exynos: audiohal_comv1: Support BT_NREC_HEADSET_MIC
repopick 391075 # exynos: audiohal_comv1: Import MMAP hardware volume control from T BSP
repopick 391076 # exynos: audiohal_comv1: When denying low latency capture ensure VOIP_TX flag ...
repopick 391077 # exynos: audiohal_comv1: Extend volume type with `VOLUME_TYPE_CALL_RX_MUTE`
repopick 391078 # exynos: audiohal_comv1: Set device for camcorder quad mic
repopick 391079 # exynos: audiohal_comv1: Also set proxy_call_status to true in communication mode
repopick 391080 # exynos: audiohal_comv1: allow to override usb playback duration
repopick 391081 # exynos: audiohal_comv1: Add listenback usage and stream definition
repopick 391082 # exynos: audiohal_comv1: Add gaming speaker device and stream definitions
repopick 391083 # exynos: audiohal_comv1: drop offload effect lib from audio hal
repopick 391084 # exynos: Import sthal
repopick 391085 # exynos: sthal: Allow specifying soundtrigger config path explicitly
repopick 391086 # exynos: sthal: Allow overriding VTSDRV_MISC_MODEL_BIN_MAXSZ
repopick 391087 # exynos: sthal: Update to latest source
repopick 391088 # exynos: sthal: Import `sound_trigger_notify_ahal_record_status` from newer sthal
repopick 391089 # exynos: audiohal_comv1: Import a2dp offload from T BSP
repopick 391090 # exynos: audiohal_comv1: Fix compile error for a2dp offload
repopick 391924 # exynos: audiohal_comv1: Fix muting
repopick 391925 # exynos: audiohal_comv1: Align to slsi audiohal_comv1 T release

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
repopick 391091 # exynos9830: Use size of product_layerAttributePriority[0] instead of uint32_t
repopick 384848 # WIP: libhwc2.1: invalidate last frame before changing display mode

# hardware/samsung_slsi-linaro/interfaces
repopick 391092 # interfaces: Import tetheroffload
repopick 391093 # interfaces: Import ExynosA2DPOffload
repopick 391094 # interfaces: ExynosA2DPOffload: Configure Android.mk files
repopick 391095 # interfaces: ExynosA2DPOffload: Allow specifying proxy path explicitly or
repopick 391096 # interfaces: Import a2dp

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
repopick 391059 # rebalance_interrupts: one shot IRQ rebalancer
repopick 391060 # [LSC] Add LOCAL_LICENSE_KINDS to hardware/samsung
repopick 391061 # rebalance_interrupts: Change affinity ownership to system
# repopick 357350 # fastcharge: move 1.0 impl to separate folder
# repopick 357351 # hidl: fastcharge: add 1.1 impl

# packages/apps/Settings
repopick -f 385494 # Add Face Unlock with ParanoidSense
repopick -f 385495 # Settings: Import missing Face Unlock animation
repopick -f 391308 # Settings: Add three-fingers-swipe to screenshot [2/2]
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
repopick -f -P frameworks/base 381475 # SystemUI: More notification icons on AOD screen
repopick -f -P vendor/lineage 369794 # lineage: Disable privapp permission enforcement (make it log)
repopick -f -P vendor/lineage 369795 # adb insecure by default
# repopick 357968 # config: add super fast charge interface

exit 0
