#!/bin/bash
#
#!/bin/bash

git clone https://github.com/wwz09/IPQ6108.git package/IPQ6108

#　web登陆密码从password修改为空
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/extra/default-settings/files/99-default-settings

#　固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='FICHEN(\$\(TZ=UTC-8 date +%Y-%m-%d\))@OpenWrt '/g" package/extra/default-settings/files/99-default-settings

#　编译的固件文件名添加日期
sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=$(shell TZ=UTC-8 date "+%Y%m%d")-$(VERSION_DIST_SANITIZED)/g' include/image.mk

# 修改 lan IP
sed -i 's/192.168.1.1/192.168.8.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/OpenWrt/Qihoo V6/g' openwrt/package/base-files/files/bin/config_generate

# 修改连接数
sed -i 's/16384/65535/g' openwrt/package/kernel/linux/files/sysctl-nf-conntrack.conf

# 修改 SSID
sed -i 's/OpenWrt/Qihoo V6/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改 wifi 地区
sed -i 's/US/CN/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh
