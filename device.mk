# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/karbonn/a9plus/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/karbonn/a9plus/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    Torch \
    setup_fs 

# Graphics 
PRODUCT_PACKAGES += \
    gralloc.msm7x27a \
    copybit.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer \
    libQcomUI

# Audio
PRODUCT_PACKAGES += \
    libacoustic \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    libaudioutils

# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    lights.msm7x27a \
    sensors.msm7x27a \
    gps.default

# Camera
PRODUCT_PACKAGES += \
        camera.msm7x27a
        
# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# APN
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml 

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.soft6ware.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Init
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/init.qcom.rc:root/init.qcom.rc \
    device/karbonn/a9plus/prebuilt/ueventd.qct.rc:root/ueventd.qct.rc \
    device/karbonn/a9plus/prebuilt/init.qcom.sh:root/init.qcom.sh \
    device/karbonn/a9plus/prebuilt/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/karbonn/a9plus/prebuilt/init.qcom.usb.rc:root/init.target.rc \
    device/karbonn/a9plus/recovery/fix_reboot.sh:recovery/root/sbin/fix_reboot.sh  

# Camera
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/lib/hw/camera.msm7627a.so:system/lib/hw/camera.msm7627a.so \
    device/karbonn/a9plus/prebuilt/system/lib/libcamera.so:system/lib/libcamera.so \
    device/karbonn/a9plus/prebuilt/system/lib/lib/system/libcamera_client.so:system/lib/libcamera_client.so \
    device/karbonn/a9plus/prebuilt/system/lib/lib/system/libcameraservice.so:system/lib/libcameraservice.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmcamera_faceproc.so:system/lib/libmmcamera_faceproc.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmcamera_frameproc.so:system/lib/libmmcamera_frameproc.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmcamera_hdr_lib.so:system/lib/libmmcamera_hdr_lib.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmcamera_image_stab.so:system/lib/libmmcamera_image_stab.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmcamera_interface2.so:system/lib/libmmcamera_interface2.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmcamera_statsproc31.so:system/lib/libmmcamera_statsproc31.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmcamera_wavelet_lib.so:system/lib/libmmcamera_wavelet_lib.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmipl.so:system/lib/libmmipl.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/karbonn/a9plus/prebuilt/system/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    device/karbonn/a9plus/prebuilt/system/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
    device/karbonn/a9plus/prebuilt/system/bin/mm-qcamera-test:system/bin/mm-qcamera-test \
    device/karbonn/a9plus/prebuilt/system/bin/mm-qcamera-testsuite-client:system/bin/mm-qcamera-testsuite-client \
    device/karbonn/a9plus/prebuilt/system/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
    device/karbonn/a9plus/prebuilt/system/lib/liboemcamera.so:system/lib/liboemcamera.so

# OMX
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/karbonn/a9plus/prebuilt/system/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/karbonn/a9plus/prebuilt/system/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/karbonn/a9plus/prebuilt/system/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so 

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

# Live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml 

PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Vold 
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/etc/vold.fstab_use_emmc:system/etc/vold.fstab_use_emmc \
    device/karbonn/a9plus/prebuilt/system/etc/vold.fstab_use_tflashvold.fstab_use_emmc:system/etc/vold.fstab_use_tflash \
    device/karbonn/a9plus/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/lib/modules/bcmdhd.so:system/lib/modules/bcmdhd.ko \
    device/karbonn/a9plus/prebuilt/system/lib/modules/lcd.so:system/lib/modules/lcd.ko 

# Wifi
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    device/karbonn/a9plus/prebuilt/system/etc/wifi/wpa_supplicant.conf:hcidumpsystem/etc/wifi/wpa_supplicant.conf \
    device/karbonn/a9plus/prebuilt/system/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/karbonn/a9plus/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/karbonn/a9plus/prebuilt/system/etc/firmware/fw_bcmdhd.bin:system/etc/firmware/fw_bcmdhd.bin \
    device/karbonn/a9plus/prebuilt/system/etc/firmware/fw_bcmdhd_apsta.bin:system/etc/firmware/fw_bcmdhd_apsta.bin \
    device/karbonn/a9plus/prebuilt/system/etc/firmware/fw_bcmdhd_p2p.bin:system/etc/firmware/fw_bcmdhd_p2p.bin 

# Audio
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/karbonn/a9plus/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/karbonn/a9plus/system/lib/libaudioeq.so:system/lib/libaudioeq.so 

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Sensors
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/system/lib/hw/sensors.msm7627a.so:system/lib/hw/sensors.msm7627a.so \
    device/karbonn/a9plus/system/hw/lib/lights.msm7627a.so:system/lib/hw/lights.msm7627a.so 

# 3D(ICS Blobs)
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/karbonn/a9plus/prebuilt/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/karbonn/a9plus/prebuilt/system/lib/libgsl.so:system/lib/libgsl.so \
    device/karbonn/a9plus/prebuilt/system/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/karbonn/a9plus/prebuilt/system/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/karbonn/a9plus/prebuilt/system/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/karbonn/a9plus/prebuilt/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/karbonn/a9plus/prebuilt/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/karbonn/a9plus/prebuilt/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/karbonn/a9plus/prebuilt/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so 

# RIL
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/lib/libdiag.so:system/lib/libdiag.so \
    device/karbonn/a9plus/prebuilt/system/lib/libreference-ril.so:system/lib/libreference-ril.so \
    device/karbonn/a9plus/prebuilt/system/lib/libril.so:system/lib/libril.so \
    device/karbonn/a9plus/prebuilt/system/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    device/karbonn/a9plus/prebuilt/system/lib/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so \
    device/karbonn/a9plus/prebuilt/system/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so 

# Bluetooth
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/karbonn/a9plus/prebuilt/system/etc/firmware/brcm_bt.hcd:system/etc/firmware/brcm_bt.hcd 

# FM Radio
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \

## Touchscreen
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/karbonn/a9plus/prebuilt/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \

# Keyboard maps
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    device/karbonn/a9plus/prebuilt/system/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/karbonn/a9plus/prebuilt/system/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/karbonn/a9plus/prebuilt/system/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/karbonn/a9plus/prebuilt/system/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/karbonn/a9plus/prebuilt/system/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl 


# Misc
PRODUCT_COPY_FILES += \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.composition_type.sh:system/etc/init.qcom.composition_type.sh \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/karbonn/a9plus/prebuilt/system/etc/hcidump.sh:system/etc/hcidump.sh \
    device/karbonn/a9plus/prebuilt/system/etc/init.goldfish.sh:system/etc/init.goldfish.sh \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.rendering.sh:system/etc/init.qcom.rendering.sh \
    device/karbonn/a9plus/prebuilt/system/etc/init.qcom.thermald_conf.sh:system/etc/init.qcom.thermald_conf.sh \
    device/karbonn/a9plus/prebuilt/system/etc/OperatorPolicy.xml:system/etc/OperatorPolicy.xml \
    device/karbonn/a9plus/prebuilt/system/etc/UserPolicy.xml:system/etc/UserPolicy.xml \
    device/karbonn/a9plus/prebuilt/system/etc/thermald.conf:system/etc/thermald.conf 

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

# MDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
$(call inherit-product, build/target/product/full_base.mk)
