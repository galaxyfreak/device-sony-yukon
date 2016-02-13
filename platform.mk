# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, device/sony/common/common.mk)

SOMC_PLATFORM := yukon

SONY_ROOT:= device/sony/yukon/rootdir

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(SONY_ROOT)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/ueventd.yukon.rc:root/ueventd.yukon.rc \
    $(SONY_ROOT)/init.class_main.sh:root/init.class_main.sh \
    $(SONY_ROOT)/init.yukon.rc:root/init.yukon.rc \
    $(SONY_ROOT)/init.yukon.usb.rc:root/init.yukon.usb.rc \
    $(SONY_ROOT)/init.yukon.pwr.rc:root/init.yukon.pwr.rc \
    $(SONY_ROOT)/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \

# Qualcom BT
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/init.yukon.bt.sh:system/etc/init.yukon.bt.sh

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml


# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag \
    nfc_nci.pn54x.default

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8226

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8226 \
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    memtrack.msm8226

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

# CAMERA
PRODUCT_PACKAGES += \
    camera.msm8226

# Lights
PRODUCT_PACKAGES += \
    lights.yukon

# Misc
PRODUCT_PACKAGES += \
    libmiscta \
    libta \
    tad_static \
    ta_qmi_service \
    ta2bin

PRODUCT_PACKAGES += \
    rmt_storage

# Recovery
PRODUCT_PACKAGES += \
    init_sony \
    toybox_static

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.yukon

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# RILD
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=NV,RUIM

# system prop for opengles version
# 196608 is decimal for 0x30000 to
# report major/minor versions as 3
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=interpret-only \
    dalvik.vm.dex2oat-swap=false \
    dalvik.vm.image-dex2oat-filter=speed

# ART
PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := \
    --compiler-filter=interpret-only

$(call add-product-dex-preopt-module-config,services,--compiler-filter=speed)
