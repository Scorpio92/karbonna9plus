# Correct bootanimation size for the screen
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Inherit device configuration
$(call inherit-product, device/karbonn/a9plus/a9plus.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Setup device configuration
PRODUCT_NAME := cm_a9plus
PRODUCT_DEVICE := a9plus
PRODUCT_BRAND := Karbonn
PRODUCT_MODEL :=  A9+
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=U8818 BUILD_FINGERPRINT=google/soju/crespo:4.0.4/IMM76D/299849:user/release-keys      PRIVATE_BUILD_DESC="soju-user 4.0.4 IMM76D 299849 release-keys" BUILD_NUMBER=299849
PRODUCT_RELEASE_NAME :a9plus
