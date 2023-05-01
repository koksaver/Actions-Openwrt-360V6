#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: 360V6.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# '修改默认IP'

sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 复制DTS 
cp -rf $GITHUB_WORKSPACE/diy/360V6/ipq6018-v6.dts ./target/linux/ipq60xx/files-4.4/arch/arm64/boot/dts/qcom/qcom-ipq6018-qihoo-v6.dts

# passwall依赖
git clone https://github.com/kenzok8/small.git package/small
rm -rf package/small/luci-app-passwall
rm -rf package/small/luci-app-passwall2
rm -rf package/small/luci-app-ssr-plus

# 常用插件 
git clone https://github.com/siwind/luci-app-wolplus.git package/luci-app-wolplus
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf
git clone https://github.com/gdck/luci-app-control-weburl.git package/luci-app-control-weburl
git clone https://github.com/ywt114/luci-app-control-timewol.git package/luci-app-control-timewol
svn co https://github.com/wwz09/openwrt-packages/trunk/luci-app-control-webrestriction package/luci-app-control-webrestriction
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-unblockneteasemusic
# svn co https://github.com/kenzok8/openwrt-packages/trunk/UnblockNeteaseMusic package/UnblockNeteaseMusic
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome package/adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ddnsto package/luci-app-ddnsto
svn co https://github.com/kenzok8/openwrt-packages/trunk/ddnsto package/ddnsto
svn co https://github.com/kenzok8/openwrt-packages/trunk/lua-maxminddb package/lua-maxminddb
svn co https://github.com/kenzok8/openwrt-packages/trunk/v2dat package/v2dat
svn co https://github.com/kenzok8/openwrt-packages/trunk/taskd package/taskd
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/luci-app-argonne-config
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ikoolproxy package/luci-app-ikoolproxy
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash package/luci-app-openclash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-serverchan package/luci-app-serverchan
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/luci-app-smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-easymesh package/luci-app-easymesh
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-pushbot package/luci-app-pushbot
# svn co https://github.com/kenzok8/small/trunk/luci-app-vssr package/luci-app-vssr
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-lib-ipkg package/luci-lib-ipkg
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-lib-taskd package/luci-lib-taskd
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-lib-xterm package/luci-lib-xterm
svn co https://github.com/kenzok8/openwrt-packages/trunk/filebrowser package/filebrowser
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-filebrowser package/luci-app-filebrowser

# weburl 文件加执行权限
chmod 7777 files/etc/init.d/weburl 
 
# 修改 luci-theme-argonne 为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' ./feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci-nginx/Makefile

# 删除 'lean主题'
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-bootstrap
rm -rf feeds/luci/collections/luci-ssl-nginx
rm -rf feeds/luci/themes/luci-theme-material
rm -rf feeds/luci/themes/luci-theme-netgear
rm -rf feeds/luci/themes/luci-theme-argon-mod

# 删除 '插件'
# rm -rf package/feeds/packages/acme
# rm -rf package/feeds/routing/bird1-ipv4-openwrt
# rm -rf package/feeds/routing/bird1-ipv6-openwrt
# rm -rf package/feeds/packages/dynapoint
# rm -rf package/feeds/routing/luci-app-bmx6
# rm -rf package/feeds/routing/luci-app-bmx7
# rm -rf package/feeds/routing/luci-app-cjdns
# rm -rf package/feeds/packages/prometheus-node-exporter-lua
# rm -rf package/small/sing-box
# rm -rf 'package/feeds/packages/sqm-scripts






