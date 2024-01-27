#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter P661N, $(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))

VENDOR_SYMLINKS := \
    $(TARGET_OUT_VENDOR)/lib/egl \
    $(TARGET_OUT_VENDOR)/lib/hw \
    $(TARGET_OUT_VENDOR)/lib64/egl \
    $(TARGET_OUT_VENDOR)/lib64/hw

$(VENDOR_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Making vendor symlinks"
	@mkdir -p $(TARGET_OUT_VENDOR)/lib/egl
	@mkdir -p $(TARGET_OUT_VENDOR)/lib/hw
	@mkdir -p $(TARGET_OUT_VENDOR)/lib64/egl
	@mkdir -p $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
	@ln -sf libMcGatekeeper.so $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.trustonic.so
	@ln -sf libMcGatekeeper.so $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.trustonic.so
	@ln -sf kmsetkey.trustonic.so $(TARGET_OUT_VENDOR)/lib/hw/kmsetkey.default.so
	@ln -sf kmsetkey.trustonic.so $(TARGET_OUT_VENDOR)/lib64/hw/kmsetkey.default.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib/egl/libGLES_mali.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib/hw/vulkan.$(TARGET_BOARD_PLATFORM).so
	@ln -sf $(TARGET_BOARD_PLATFORM)/android.hardware.graphics.allocator@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/android.hardware.graphics.mapper@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/arm.graphics-V1-ndk_platform.so $(TARGET_OUT_VENDOR)/lib/arm.graphics-V1-ndk_platform.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/arm.graphics-ndk_platform.so $(TARGET_OUT_VENDOR)/lib/arm.graphics-ndk_platform.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libaiselector.so $(TARGET_OUT_VENDOR)/lib/libaiselector.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libdpframework.so $(TARGET_OUT_VENDOR)/lib/libdpframework.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libgpudataproducer.so $(TARGET_OUT_VENDOR)/lib/libgpudataproducer.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libmtk_drvb.so $(TARGET_OUT_VENDOR)/lib/libmtk_drvb.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libnir_neon_driver.so $(TARGET_OUT_VENDOR)/lib/libnir_neon_driver.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libpq_prot.so $(TARGET_OUT_VENDOR)/lib/libpq_prot.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/vulkan.mali.so $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mali.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib64/egl/libGLES_mali.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.$(TARGET_BOARD_PLATFORM).so
	@ln -sf $(TARGET_BOARD_PLATFORM)/android.hardware.graphics.allocator@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/android.hardware.graphics.mapper@4.0-impl-mediatek.so $(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/arm.graphics-V1-ndk_platform.so $(TARGET_OUT_VENDOR)/lib64/arm.graphics-V1-ndk_platform.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/arm.graphics-ndk_platform.so $(TARGET_OUT_VENDOR)/lib64/arm.graphics-ndk_platform.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libDR.so $(TARGET_OUT_VENDOR)/lib64/libDR.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libaiselector.so $(TARGET_OUT_VENDOR)/lib64/libaiselector.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libdpframework.so $(TARGET_OUT_VENDOR)/lib64/libdpframework.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libgpudataproducer.so $(TARGET_OUT_VENDOR)/lib64/libgpudataproducer.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libmcv_runtime.so $(TARGET_OUT_VENDOR)/lib64/libmcv_runtime.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libmdla_ut.so $(TARGET_OUT_VENDOR)/lib64/libmdla_ut.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libmnl.so $(TARGET_OUT_VENDOR)/lib64/libmnl.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libmtk_drvb.so $(TARGET_OUT_VENDOR)/lib64/libmtk_drvb.so=
	@ln -sf $(TARGET_BOARD_PLATFORM)/libnir_neon_driver.so $(TARGET_OUT_VENDOR)/lib64/libnir_neon_driver.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/libpq_prot.so $(TARGET_OUT_VENDOR)/lib64/libpq_prot.so
	@ln -sf $(TARGET_BOARD_PLATFORM)/vulkan.mali.so $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mali.so
	$(hide) touch $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_SYMLINKS)

endif
