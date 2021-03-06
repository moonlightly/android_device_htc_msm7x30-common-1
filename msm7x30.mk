#
# Copyright (C) 2011 The CyanogenMod Project
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
#
COMMON_PATH := device/htc/msm7x30-common

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Common 7x30 firmware
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    $(COMMON_PATH)/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    $(COMMON_PATH)/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    $(COMMON_PATH)/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    $(COMMON_PATH)/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    $(COMMON_PATH)/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    $(COMMON_PATH)/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    $(COMMON_PATH)/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    $(COMMON_PATH)/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    $(COMMON_PATH)/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    $(COMMON_PATH)/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Device-Specific HALs
PRODUCT_PACKAGES += \
    lights.msm7x30 \
    sensors.msm7x30 \
    power.msm7x30

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x30 \
    audio_policy.msm7x30 \
    libaudioutils \
    audio.usb.default \
    libtinyalsa

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libtilerenderer \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \

# Qcom omx
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libc2dcolorconvert \
    libOmxCore \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc

# Wireless
PRODUCT_PACKAGES += \
    libnetcmdiface

# Gps
PRODUCT_PACKAGES += \
    gps.glacier

# Camera
PRODUCT_PACKAGES += \
    libsurfaceflinger_client

# Misc
PRODUCT_PACKAGES += \
#    DeviceSettings \
    com.android.future.usb.accessory

# Common build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=4.0_r1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.config.low_ram=true \
    persist.sys.usb.config=mass_storage,adb

# Msm7x30 specific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=12 \
    com.qc.hardware=true \
    debug.egl.hw=1 \
    debug.sf.hw=1 \
    debug.mdpcomp.logs=0 \
    dev.pm.dyn_samplingrate=1 \
    ro.opengles.version=131072

# Wifi firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US
