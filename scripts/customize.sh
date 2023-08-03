#!/bin/bash

# 修改 lan IP
sed -i 's/192.168.1.1/192.168.3.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/OpenWrt/router-v6/g' openwrt/package/base-files/files/bin/config_generate

# 修改连接数
sed -i 's/16384/65535/g' openwrt/package/kernel/linux/files/sysctl-nf-conntrack.conf

# 修改 SSID
sed -i 's/OpenWrt/chainsx-bee/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改 wifi 地区
sed -i 's/US/CN/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh
