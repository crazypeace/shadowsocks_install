software=(Shadowsocks-Python ShadowsocksR Shadowsocks-Go Shadowsocks-libev)

pause() {
  read -rsp "$(echo -e "按 Enter 回车键 继续....或按 Ctrl + C 取消.")" -d $'\n'
  echo
}

echo "假装这是一个互动安装脚本"

#############
echo  "Which Shadowsocks server you'd select:"
for ((i=1;i<=${#software[@]};i++ )); do
    hint="${software[$i-1]}"
    echo -e "${green}${i}${plain}) ${hint}"
done
read -p "Please enter a number (Default ${software[0]}):" selected
[ -z "${selected}" ] && selected='1'
case "${selected}" in
    1|2|3|4)
    echo
    echo "You choose = ${software[${selected}-1]}"
    echo
    ;;
esac

#############
echo "Please enter password for ${software[${selected}-1]}"
read -p '(Default password: teddysun.com):' shadowsockspwd
[ -z "${shadowsockspwd}" ] && shadowsockspwd='teddysun.com'
echo
echo "password = ${shadowsockspwd}"

#############
pause