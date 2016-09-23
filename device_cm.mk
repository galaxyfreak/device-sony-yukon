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

# dtbtool
PRODUCT_PACKAGES += \
    dtbTool

# Snap
PRODUCT_PACKAGES += \
    Snap

# Bootimg tools
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# FM radio
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2 \
    FMRecord

# Telephony packages
PRODUCT_PACKAGES += \
    telephony-ext
PRODUCT_BOOT_JARS += \
    telephony-ext

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnGSMDevice=1

PRODUCT_COPY_FILES += \
     device/sony/yukon/rootdir/logo.rle:root/logo.rle

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1
