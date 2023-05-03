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

