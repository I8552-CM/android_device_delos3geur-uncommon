# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/delos3geur/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES := hdpi

## CMAccount
PRODUCT_PACKAGES += \
    CMAccount

## Video
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

## Graphics
PRODUCT_PACKAGES += \
    libgenlock \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    libqdMetaData \
    memtrack.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer

## Camera
PRODUCT_PACKAGES += \
    camera.msm7x27a

## Misc.
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    com.android.future.usb.accessory

## Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudioutils \
    libdashplayer \
    libtinyalsa \
    libaudio-resampler

## Other HALs
PRODUCT_PACKAGES += \
    lights.msm7x27a \
    gps.msm7x27a \
    power.msm7x27a \
    libhealthd.msm7x27a

## FM radio
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth-headers \
    hciconfig \
    hciattach \
    btmon \
    btproxy \
    bluetoothd-snoop \
    btmgmt \
    hcitool \
    l2ping \
    libsbc \
    avinfo \
    bccmd \
    haltest \
    libdbus \
    audio.sco.default \
    bluetoothd

# Other
PRODUCT_PACKAGES += \
    libnetcmdiface \
    libqservice

# Product specific Packages
PRODUCT_PACKAGES += \
    SamsungServiceMode

#FM
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/prebuilt/fm/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh

## Recovery
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/recovery/sbin/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery \
    device/samsung/delos3geur/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

## Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

## Qosmgr
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/prebuilt/qosmgr_rules.xml:system/etc/qosmgr_rules.xml

## Media
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/prebuilt/media_codecs.xml:system/etc/media_codecs.xml \
    device/samsung/delos3geur/prebuilt/media_profiles.xml:system/etc/media_profiles.xml 

## Audio
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/prebuilt/audio/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/delos3geur/prebuilt/audio/AudioFilter.csv:system/etc/AudioFilter.csv

## Init files
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/ramdisk/charger:root/charger \
    device/samsung/delos3geur/ramdisk/fstab.qcom:root/fstab.qcom \
    device/samsung/delos3geur/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/samsung/delos3geur/ramdisk/init.qcom.bt.rc:root/init.qcom.bt.rc \
    device/samsung/delos3geur/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/samsung/delos3geur/ramdisk/init.qcom.ril.path.sh:root/init.qcom.ril.path.sh \
    device/samsung/delos3geur/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/delos3geur/ramdisk/lpm.rc:root/lpm.rc \
    device/samsung/delos3geur/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc
#PRODUCT_COPY_FILES += \
#device/samsung/delos3geur/ramdisk/lpm.rc:root/lpm.rc \
#device/samsung/delos3geur/ramdisk/init.qcom.bt.rc:root/init.qcom.bt.rc \
#device/samsung/delos3geur/ramdisk/init.device.rc:root/init.device.rc \
#device/samsung/delos3geur/ramdisk/fstab.qcom:root/fstab.qcom \
#device/samsung/delos3geur/ramdisk/init.qcom.rc:root/init.qcom.rc \
#device/samsung/delos3geur/ramdisk/init.qcom.ril.sh:root/init.qcom.ril.sh \
#device/samsung/delos3geur/ramdisk/init.bluetooth.rc:root/init.bluetooth.rc \
#device/samsung/delos3geur/ramdisk/initlogo.rle:root/initlogo.rle \
#device/samsung/delos3geur/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
#device/samsung/delos3geur/ramdisk/initlogo_swa.rle:root/initlogo_swa.rle \
#device/samsung/delos3geur/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
#device/samsung/delos3geur/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh

## Bluetooth files
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/prebuilt/bluetooth/init.bt.sh:system/etc/init.bt.sh \

## Misc files
PRODUCT_COPY_FILES += \
    vendor/samsung/delos3geur/proprietary/lib/liboncrpc.so:obj/lib/liboncrpc.so \
    vendor/samsung/delos3geur/proprietary/lib/libnv.so:obj/lib/libnv.so \
    vendor/samsung/delos3geur/proprietary/lib/libaudcal.so:obj/lib/libaudcal.so \

## Network
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/prebuilt/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/delos3geur/prebuilt/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/samsung/delos3geur/prebuilt/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

## Audio
PRODUCT_COPY_FILES += \
    device/samsung/delos3geur/prebuilt/audio/audio_policy.conf:system/etc/audio_policy.conf

## Charger
PRODUCT_PACKAGES += \
    charger_res_images 

## Properties
## Media
PRODUCT_PROPERTY_OVERRIDES += \
    mm.enable.smoothstreaming=true

## RIL
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \
    ro.telephony.call_ring=0 \

## SF
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    ro.opengles.version=131072 \
    debug.gralloc.map_fb_memory=1 \
    debug.hwc.fakevsync=1

## FM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.analogpath.supported=true \
    ro.fm.transmitter=false \
    ro.fm.mulinst.recording.support=false

## QCom HW
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    debug.composition.type=dyn \
    persist.hwc.mdpcomp.enable=false

## MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.vold.umsdirtyratio=50 

## WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=60
## Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.secure=0

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, vendor/samsung/delos3geur/delos3geur-vendor.mk)
