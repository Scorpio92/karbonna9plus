LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a9plus)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
