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

git clone https://github.com/gdck/luci-app-control-weburl.git package/luci-app-control-weburl

svn co　https://github.com/kenzok8/openwrt-packages/trunk/ddnsto package/ddnsto　--username kenzok8
svn co　https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ddnsto package/luci-app-ddnsto　--username kenzok8
svn co　https://github.com/kenzok8/openwrt-packages/trunk/lua-maxminddb package/lua-maxminddb　--username kenzok8
svn co　https://github.com/wwz09/openwrt-packages/trunk/luci-app-control-webrestriction package/luci-app-control-webrestriction　--username wwz09
svn co　https://github.com/kenzok8/small/trunk/luci-app-vssr package/luci-app-vssr　--username kenzok8
