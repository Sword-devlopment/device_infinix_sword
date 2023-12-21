# Remove Existing Repos
rm -rf vendor/xiaomi/light
rm -rf hardware/xiaomi
rm -rf hardware/mediatek
rm -rf device/mediatek/sepolicy_vndr

# Clone Repos
git clone https://github.com/Sword-devlopment/android_vendor_infinix_sword.git vendor/xiaomi/sword
git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi
git clone https://github.com/nashc-dev/android_hardware_mediatek hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr
