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
# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default

# echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

# '修改默内核'
# sed -i 's/PATCHVER:=5.4/PATCHVER:=5.10/g' target/linux/ipq40xx/Makefile         # ipq40xx，内核：5.4，内核为5.10

# 修改默认 IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 复制DTS 
# cp -rf $GITHUB_WORKSPACE/diy/360V6/ipq6018-v6.dts ./target/linux/ipq60xx/files/arch/arm64/boot/dts/qcom/ipq6018-v6.dts

cp -rf $GITHUB_WORKSPACE/diy/360V6/ipq6018-v6.dts ./target/linux/ipq60xx/files-4.4/arch/arm64/boot/dts/qcom/qcom-ipq6018-qihoo-v6.dts

# 发现并删除文件
# find ./ -name luci-theme-argon | xargs rm -rf;
# find ./ -name luci-app-argon-config | xargs rm -rf;

# 删除 'lean主题'
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon-mod
rm -rf feeds/luci/themes/luci-theme-material
rm -rf feeds/luci/themes/luci-theme-netgear
# rm -rf feeds/luci/themes/luci-theme-bootstrap
rm -rf feeds/kenzok/luci-app-argon-config
rm -rf feeds/kenzok/luci-theme-argon
rm -rf feeds/kenzok/luci-theme-atmaterial_new
rm -rf feeds/kenzok/luci-theme-opentopd
rm -rf feeds/kenzok/luci-theme-tomato
rm -rf feeds/luci/applications/luci-app-argon-config

# 删除 '不用插件'
rm -rf feeds/small/luci-app-passwall
rm -rf feeds/small/luci-app-passwall2
rm -rf feeds/small/luci-app-ssr-plus
rm -rf feeds/kenzok/luci-app-amlogic
rm -rf feeds/kenzok/luci-app-openclash
rm -rf feeds/kenzok/luci-theme-tomato
rm -rf feeds/kenzok/luci-app-unblockneteasemusic
rm -rf package/feeds/kenzo/luci-app-amlogic
rm -rf package/feeds/kenzo/luci-app-dockerman
rm -rf package/feeds/kenzo/luci-app-easymesh
rm -rf feeds/small/sing-box



# 修改 luci-theme-argonne 为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile
sed -i 's/#5e72e4/#E7651A/g' package/feeds/kenzo/luci-app-argonne-config/root/etc/config/argonne
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' package/feeds/luci/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' package/feeds/luci/luci-ssl-nginx/Makefile

#添加额外非必须软件包

git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf
git clone https://github.com/gdck/luci-app-control-weburl.git package/luci-app-control-weburl
svn co https://github.com/wwz09/openwrt-packages/trunk/luci-app-control-webrestriction package/luci-app-control-webrestriction
# svn co https://github.com/wwz09/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argonne
# svn co https://github.com/wwz09/openwrt-packages/trunk/luci-app-argonne-config package/luci-app-argonne-config
# git clone https://github.com/ywt114/luci-app-control-timewol.git package/luci-app-control-timewol

# weburl 文件加执行权限
chmod 7777 files/etc/init.d/weburl 

#添加smartdns
# git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
