lib_LTLIBRARIES += \
    %reldir%/libandroid-nativeloader.la

%canon_reldir%_libandroid_nativeloader_la_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(LOG_CFLAGS) \
    $(CUTILS_CFLAGS) \
    $(BASE_CFLAGS) \
    $(NATIVEHELPER_CFLAGS) \
    -I$(srcdir)/%reldir%/include
%canon_reldir%_libandroid_nativeloader_la_CXXFLAGS = \
    $(AM_CXXFLAGS) \
    -std=gnu++14 -fvisibility=hidden
%canon_reldir%_libandroid_nativeloader_la_SOURCES = \
    %reldir%/native_loader.cpp
%canon_reldir%_libandroid_nativeloader_la_LDFLAGS = \
    $(AM_LDFLAGS) \
    $(libtool_opts)
%canon_reldir%_libandroid_nativeloader_la_LIBADD = \
    $(LIBADD_DL) \
    $(LOG_LIBS) \
    $(CUTILS_LIBS) \
    $(BASE_LIBS)

%canon_reldir%_libandroid_nativeloader_incdir = $(androidincdir)/nativeloader
%canon_reldir%_libandroid_nativeloader_inc_HEADERS = \
    %reldir%/include/nativeloader/native_loader.h

pkgconfig_DATA += \
    %reldir%/android-nativeloader-$(LAARID_API_VERSION).pc
