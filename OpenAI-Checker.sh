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
        printf "\r %-20s:\t${Font_Red}No${Font_Suffix}\n" "${type}_ChatGPT ipv${ipv}"
    else
        printf "\r %-20s:\t${Font_Green}Yes${Font_Suffix}\n" "${type}_ChatGPT ipv${ipv}"
    fi
}

# 检查 Web ChatGPT
check_vpn "https://chat.openai.com/" "VPN" "Web" "4"

# 检查 iOS ChatGPT
check_vpn "https://ios.chat.openai.com/" "VPN" "iOS" "4"

# 检查 Android ChatGPT
check_vpn "https://android.chat.openai.com/" "VPN" "Android" "4"

# 检查 Web ChatGPT
check_vpn "https://chat.openai.com/" "VPN" "Web" "6"

# 检查 iOS ChatGPT
check_vpn "https://ios.chat.openai.com/" "VPN" "iOS" "6"

# 检查 Android ChatGPT
check_vpn "https://android.chat.openai.com/" "VPN" "Android" "6"
