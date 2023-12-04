#!/bin/bash

Font_Green="\033[32m"
Font_Red="\033[31m"
Font_Suffix="\033[0m"

check_vpn() {
    url=$1
    keyword=$2
    type=$3
    ipv=$4

    # 发送请求并获取页面内容
    response=$(curl -s -"$ipv" "$url")

    # 检查页面内容是否包含关键字
    if echo "$response" | grep -q "$keyword"; then
        printf "\r %-20s:\t${Font_Red}No${Font_Suffix}\n" "ipv${ipv} ${type}_ChatGPT"
    else
        printf "\r %-20s:\t${Font_Green}Yes${Font_Suffix}\n" "ipv${ipv} ${type}_ChatGPT"
    fi
}

# 先检查系统是否支持 IPv4
if ping4 -c 4 google.com > /dev/null 2>&1; then
    ipv4_supported=true
else
    ipv4_supported=false
fi

# 先检查系统是否支持 IPv6
if ping6 -c 4 google.com > /dev/null 2>&1; then
    ipv6_supported=true
else
    ipv6_supported=false
fi

# 如果支持 IPv4，则检查 IPv4 的 ChatGPT
if [ "$ipv4_supported" = true ]; then
    # 检查 Web ChatGPT (IPv4)
    check_vpn "https://chat.openai.com/" "VPN" "Web" "4"

    # 检查 iOS ChatGPT (IPv4)
    check_vpn "https://ios.chat.openai.com/" "VPN" "iOS" "4"

    # 检查 Android ChatGPT (IPv4)
    check_vpn "https://android.chat.openai.com/" "VPN" "Android" "4"
fi

# 如果支持 IPv6，则检查 IPv6 的 ChatGPT
if [ "$ipv6_supported" = true ]; then
    # 检查 Web ChatGPT (IPv6)
    check_vpn "https://chat.openai.com/" "VPN" "Web" "6"

    # 检查 iOS ChatGPT (IPv6)
    check_vpn "https://ios.chat.openai.com/" "VPN" "iOS" "6"

    # 检查 Android ChatGPT (IPv6)
    check_vpn "https://android.chat.openai.com/" "VPN" "Android" "6"
fi
