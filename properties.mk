#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.camera.aec.sync=1 \
persist.vendor.camera.awb.sync=2 \
persist.vendor.camera.expose.aux=1

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.ctm.disallowed=true

# Blur
PRODUCT_PROPERTY_OVERRIDES += \
ro.surface_flinger.supports_background_blur=1 \
ro.sf.blurs_are_expensive=1

# Memory optimization
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.qti.am.reschedule_service=true

# RAM Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
ro.config.fha_enable=true \
ro.sys.fw.bg_apps_limit=32 \
ro.config.dha_cached_max=16 \
ro.config.dha_empty_max=42 \
ro.config.dha_empty_init=32 \
ro.config.dha_lmk_scale=0.545 \
ro.config.dha_th_rate=2.3 \
ro.config.sdha_apps_bg_max=64 \
ro.config.sdha_apps_bg_min=8

# Fast App Launch
PRODUCT_PROPERTY_OVERRIDES += \
persist.device_config.runtime_native.usap_pool_enabled=true

# Power saving
PRODUCT_PROPERTY_OVERRIDES += \
power.saving.mode=1 \
pm.sleep_mode=1

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
debug.sf.disable_backpressure=1 \
debug.sf.enable_hwc_vds=0 \
debug.sf.early_app_phase_offset_ns=1500000 \
debug.sf.early_gl_app_phase_offset_ns=15000000 \
debug.sf.early_gl_phase_offset_ns=3000000 \
debug.sf.early_phase_offset_ns=1500000 \
debug.hwui.renderer=skiagl \
ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
ro.surface_flinger.max_virtual_display_dimension=4096 \
ro.surface_flinger.set_idle_timer_ms=9000 \
ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
ro.surface_flinger.protected_contents=true

# ZRAM
PRODUCT_PROPERTY_OVERRIDES += \
ro.zram.mark_idle_delay_mins=60 \
ro.zram.first_wb_delay_mins=180 \
ro.zram.periodic_wb_delay_hours=24

# HWUI properties
PRODUCT_PROPERTY_OVERRIDES += \
ro.hwui.texture_cache_size=72 \
ro.hwui.layer_cache_size=48 \
ro.hwui.r_buffer_cache_size=8 \
ro.hwui.path_cache_size=32 \
ro.hwui.gradient_cache_size=1 \
ro.hwui.drop_shadow_cache_size=6 \
ro.hwui.texture_cache_flushrate=0.4 \
ro.hwui.text_small_cache_width=1024 \
ro.hwui.text_small_cache_height=1024 \
ro.hwui.text_large_cache_width=2048 \
ro.hwui.text_large_cache_height=2048
