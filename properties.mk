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
persist.sys.sf.disable_blurs=1 \
ro.sf.blurs_are_expensive=1

# Memory optimization
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.qti.sys.fw.bservice_enable=true \
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

# Graphic
debug.sf.disable_backpressure=1
debug.sf.enable_hwc_vds=0
debug.sf.hw=0
debug.sf.latch_unsignaled=1
debug.hwui.renderer=skiagl
persist.demo.hdmirotationlock=false
ro.surface_flinger.force_hwc_copy_for_virtual_displays=true
ro.surface_flinger.max_virtual_display_dimension=4096
vendor.display.disable_skip_validate=1
