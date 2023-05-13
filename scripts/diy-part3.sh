#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Enable Cache
echo -e 'CONFIG_DEVEL=y\nCONFIG_CCACHE=y' >> .config

#　添加新插件
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf

git clone https://github.com/wwz09/IPQ6108.git package/IPQ6108

# git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

#　web登陆密码从password修改为空
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package\addition\default-settings\files/99-default-settings

#　固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='FICHEN(\$\(TZ=UTC-8 date +%Y-%m-%d\))@OpenWrt '/g" package\addition\default-settings\files/99-default-settings

#　编译的固件文件名添加日期
sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=$(shell TZ=UTC-8 date "+%Y%m%d")-$(VERSION_DIST_SANITIZED)/g' include/image.mk

#　修改主机名
sed -i "s/hostname='OpenWrt'/hostname='Qihoo V6'/g" package/base-files/files/bin/config_generate

# 添加自动挂载磁盘脚本
# mkdir -p files/etc/hotplug.d/block && wget -O files/etc/hotplug.d/block/30-usbmount https://raw.githubusercontent.com/fichenx/P3TERX_Actions-OpenWrt/main/files/etc/hotplug.d/block/30-usbmount && chmod 755 files/etc/hotplug.d/block/30-usbmount

rm -rf package/qca/nss/qca-nss-clients
rm -rf package/qca/nss/qca-nss-crypto
rm -rf package/qca/nss/qca-nss-dp
rm -rf package/qca/nss/qca-nss-drv
rm -rf package/qca/nss/qca-nss-ecm
rm -rf package/qca/nss/qca-ssdk
rm -rf package/qca/nss/qca-ssdk-shell

cp -rf $GITHUB_WORKSPACE/patches/qca-nss-clients package/qca/nss/qca-nss-clients
cp -rf $GITHUB_WORKSPACE/patches/qca-nss-crypto package/qca/nss/qca-nss-crypto
cp -rf $GITHUB_WORKSPACE/patches/qca-nss-dp package/qca/nss/qca-nss-dp
cp -rf $GITHUB_WORKSPACE/patches/qca-nss-drv package/qca/nss/qca-nss-drv
cp -rf $GITHUB_WORKSPACE/patches/qca-nss-ecm package/qca/nss/qca-nss-ecm
cp -rf $GITHUB_WORKSPACE/patches/qca-ssdk package/qca/nss/qca-ssdk
cp -rf $GITHUB_WORKSPACE/patches/qca-ssdk-shell package/qca/nss/qca-ssdk-shell

