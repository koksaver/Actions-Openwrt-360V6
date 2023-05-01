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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 删除 'lean主题'
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf package/lean/luci-theme-argon
rm -rf feeds/kenzok/luci-theme-argon
rm -rf feeds/kenzok/luci-app-argon-config

# 修改 luci-theme-argonne 为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' ./feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci-nginx/Makefile

#添加额外非必须软件包
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf
git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper
git clone https://github.com/sirpdboy/luci-app-advanced package/luci-app-advanced
git clone https://github.com/gdck/luci-app-control-weburl.git package/luci-app-control-weburl
svn co https://github.com/wwz09/openwrt-packages/trunk/luci-app-control-webrestriction package/luci-app-control-webrestriction
git clone https://github.com/ywt114/luci-app-control-timewol.git package/luci-app-control-timewol

# weburl 文件加执行权限
chmod 7777 files/etc/init.d/weburl 

#添加smartdns
git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter

git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
# Add luci-theme-argon