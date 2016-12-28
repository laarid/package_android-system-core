#
# Copyright (C) 2008-2014 The Android Open Source Project
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

lib_LTLIBRARIES += \
	%reldir%/libandroid-log.la

%canon_reldir%_libandroid_log_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS)
# This is what we want to do:
#  liblog_cflags := $(shell \
#   sed -n \
#       's/^\([0-9]*\)[ \t]*liblog[ \t].*/-DLIBLOG_LOG_TAG=\1/p' \
#       $(LOCAL_PATH)/event.logtags)
# so make sure we do not regret hard-coding it as follows:
%canon_reldir%_libandroid_log_la_CPPFLAGS += \
	-DLIBLOG_LOG_TAG=1005
%canon_reldir%_libandroid_log_la_CFLAGS = \
	$(AM_CFLAGS) \
	$(BIONIC_CFLAGS)
%canon_reldir%_libandroid_log_la_LIBADD = \
	$(BIONIC_LIBS)
%canon_reldir%_libandroid_log_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
if CPU_ARM
# TODO: This is to work around b/19059885. Remove after root cause is fixed
%canon_reldir%_libandroid_log_la_LDFLAGS += \
	-Wl,--hash-style=both
endif
%canon_reldir%_libandroid_log_la_SOURCES = \
	%reldir%/event_tag_map.c \
	%reldir%/logprint.c \
	%reldir%/log_is_loggable.c \
	%reldir%/log_time.cpp \
	%reldir%/log_read.c \
	%reldir%/logd_write.c

pkgconfig_DATA += \
	%reldir%/android-log-$(SYSTEMCORE_API_VERSION).pc
