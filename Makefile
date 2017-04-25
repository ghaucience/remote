
#
# Copyright (C) 2011-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=remote
PKG_VERSION:=0.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=DUSUN
  CATEGORY:=DUSUN
  TITLE:=DUSUN $(PKG_NAME) Stuff
	DEPENDS:= +libpthread +librt +libstdcpp
endef

define Package/$(PKG_NAME)/description
	$(PKG_NAME) stuff 
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	cp ./src/* $(PKG_BUILD_DIR) -rf
endef

define Build/Configure
endef

#TARGET_CFLAGS += $(FPIC)
#TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib -lm
#	$(MAKE) -C $(PKG_BUILD_DIR) \
#		CC="$(TARGET_CC)" \
#		CFLAGS="$(TARGET_CFLAGS) -Wall" \
#		LDFLAGS="$(TARGET_LDFLAGS)"
#$(warning MAKE_FLAGS--------------------- is $(MAKE_FLAGS))
#$(warning MAKE_VARS---------------------- is $(MAKE_VARS))
#$(MAKE_FLAGS) $(MAKE_VARS)
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

