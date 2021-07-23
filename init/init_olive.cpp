/*
   Copyright (c) 2016, The CyanogenMod Project
   Copyright (c) 2019, The LineageOS Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <cstring>
#include <fstream>
#include <string.h>
#include <sys/sysinfo.h>
#include <unistd.h>

#include <android-base/file.h>
#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"

using android::base::GetProperty;

char const *heapstartsize;
char const *heapgrowthlimit;
char const *heapsize;
char const *heapminfree;
char const *heapmaxfree;
char const *heaptargetutilization;

void property_override(char const prop[], char const value[], bool add = true)
{
    auto pi = (prop_info *) __system_property_find(prop);

    if (pi != nullptr) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void check_device()
{
    struct sysinfo sys;

    sysinfo(&sys);

    if (sys.totalram > 5072ull * 1024 * 1024) {
        // from - phone-xhdpi-6144-dalvik-heap.mk
        heapstartsize = "16m";
        heapgrowthlimit = "256m";
        heapsize = "512m";
        heaptargetutilization = "0.5";
        heapminfree = "8m";
        heapmaxfree = "32m";
    } else if (sys.totalram > 3072ull * 1024 * 1024) {
        // from - phone-xxhdpi-4096-dalvik-heap.mk
        heapstartsize = "8m";
        heapgrowthlimit = "256m";
        heapsize = "512m";
        heaptargetutilization = "0.6";
        heapminfree = "8m";
        heapmaxfree = "16m";
    } else if (sys.totalram > 1024ull * 1024 * 1024) {
        // from - phone-xhdpi-2048-dalvik-heap.mk
        heapstartsize = "8m";
        heapgrowthlimit = "192m";
        heapsize = "512m";
        heaptargetutilization = "0.75";
        heapminfree = "512k";
        heapmaxfree = "8m";
    } else {
        // from - phone-xhdpi-1024-dalvik-heap.mk
        heapstartsize = "8m";
        heapgrowthlimit = "96m";
        heapsize = "256m";
        heaptargetutilization = "0.75";
        heapminfree = "512k";
        heapmaxfree = "8m";
    }
}

void build_description_override(const char *build_desc)
{
    property_override("ro.build.description", build_desc);
    property_override("ro.build.display.id", build_desc);
}

void build_fingerprint_override(const char *build_fp)
{
    property_override("ro.bootimage.build.fingerprint", build_fp);
    property_override("ro.build.fingerprint", build_fp);
    property_override("ro.odm.build.fingerprint", build_fp);
    property_override("ro.product.build.fingerprint", build_fp);
    property_override("ro.system.build.fingerprint", build_fp);
    property_override("ro.system_ext.build.fingerprint", build_fp);
    property_override("ro.vendor.build.fingerprint", build_fp);
}

void security_patch_date_override(const char *sp_date)
{
//  property_override("ro.build.version.security_patch", sp_date);
    property_override("ro.vendor.build.security_patch", sp_date);
}

static void SetSafetyNetProps() {
    property_override("ro.boot.flash.locked", "1");
    property_override("ro.boot.verifiedbootstate", "green");
    property_override("vendor.boot.verifiedbootstate", "green");
    property_override("ro.boot.veritymode", "enforcing");
    property_override("ro.boot.vbmeta.device_state", "locked");
    property_override("vendor.boot.vbmeta.device_state", "locked");
}

static void build_keys_override(const char *build_keys)
{
    property_override("ro.build.tags", build_keys);
    property_override("ro.odm.build.tags", build_keys);
    property_override("ro.product.build.tags", build_keys);
    property_override("ro.system.build.tags", build_keys);
    property_override("ro.system_ext.build.tags", build_keys);
    property_override("ro.vendor.build.tags", build_keys);
}

static void set_model_name(const char *model_name)
{
    property_override("ro.product.model", model_name);
    property_override("ro.product.odm.model", model_name);
    property_override("ro.product.product.model", model_name);
    property_override("ro.product.system.model", model_name);
    property_override("ro.product.system_ext.model", model_name);
    property_override("ro.product.vendor.model", model_name);
}

static void load_mi8937_model_name()
{
    std::string tempstr;
    if(android::base::ReadFileToString("/proc/device-tree/xiaomi,device", &tempstr)) {
        const char *fdt_xiaomi_device = tempstr.c_str();
        if (strcmp(fdt_xiaomi_device, "land") == 0) {
            set_model_name("Redmi 3(S/SP/X)");
        } else if (strcmp(fdt_xiaomi_device, "prada") == 0) {
            set_model_name("Redmi 4");
        } else if (strcmp(fdt_xiaomi_device, "riva") == 0) {
            set_model_name("Redmi 5A");
        } else if (strcmp(fdt_xiaomi_device, "rolex") == 0) {
            set_model_name("Redmi 4A");
        } else if (strcmp(fdt_xiaomi_device, "santoni") == 0) {
            set_model_name("Redmi 4X");
        } else if (strcmp(fdt_xiaomi_device, "ugg") == 0) {
            set_model_name("Redmi Note 5A / Y1 Prime");
        } else if (strcmp(fdt_xiaomi_device, "ugglite") == 0) {
            set_model_name("Redmi Note 5A / Y1 Lite");
        }
    }
}

static void enable_iorap()
{
	property_override("ro.iorapd.enable","true");
	property_override("iorapd.perfetto.enable","true");
	property_override("iorapd.readahead.enable","true");
}

void vendor_load_properties()
{
    load_mi8937_model_name();

    check_device();

    build_description_override("redfin-user 11 RQ3A.210605.005 7349499 release-keys");
    build_fingerprint_override("google/redfin/redfin:11/RQ3A.210605.005/7349499:user/release-keys");
    security_patch_date_override("2021-06-05");

    // Report a valid verified boot chain to make Google SafetyNet integrity
    // checks pass. This needs to be done before parsing the kernel cmdline as
    // these properties are read-only and will be set to invalid values with
    // androidboot cmdline arguments.
    SetSafetyNetProps();

    build_keys_override("release-keys");

    // IORap
    enable_iorap();

    property_override("dalvik.vm.heapstartsize", heapstartsize);
    property_override("dalvik.vm.heapgrowthlimit", heapgrowthlimit);
    property_override("dalvik.vm.heapsize", heapsize);
    property_override("dalvik.vm.heaptargetutilization", heaptargetutilization);
    property_override("dalvik.vm.heapminfree", heapminfree);
    property_override("dalvik.vm.heapmaxfree", heapmaxfree);
}
