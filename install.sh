#!/usr/bin/env bash
set -e

#daili='https://git.metauniverse-cn.com/'
daili=''

if [ -d /ql/data/config ];then
    QLMainPath='/ql/data'
else
    QLMainPath='/ql'
fi
echo -e "\n\t\t\t你的青龙版本为:${QL_BRANCH}\n"



gitPull(){
    echo -e "\n2.开始拉取所需代码\n"
    if [ ! -d ${QLMainPath}/jbot ]; then
        mkdir ${QLMainPath}/jbot
    else
        rm -rf ${QLMainPath}/jbot/*
    fi
    cd ${QLMainPath}/repo && rm -rf gd && git clone ${daili}https://github.com/curtinlv/gd.git
    cp -a ${QLMainPath}/repo/gd/* ${QLMainPath}/jbot && cp -a ${QLMainPath}/jbot/conf/* ${QLMainPath}/config && cp -a ${QLMainPath}/jbot/jk_script/* ${QLMainPath}/scripts
    rm -rf ${QLMainPath}/repo/dockerbot
    mkdir ${QLMainPath}/repo/dockerbot && ln -sf ${QLMainPath}/repo/gd ${QLMainPath}/repo/dockerbot/jbot && ln -sf ${QLMainPath}/repo/gd/conf ${QLMainPath}/repo/dockerbot/config
    if [ ! -d ${QLMainPath}/log/bot ]; then
        mkdir ${QLMainPath}/log/bot
    fi

}

# start

echo
echo -e "\n\t\t\t【青龙安装Bot监控】\n"
echo
if [ -f ${QLMainPath}/jbot/user/user.py ];then
    echo -e "\n你已部署，请启动即可:\ncd ${QLMainPath}\npython3 -m jbot\n\n或参考本仓库第3-4步:\nhttps://github.com/curtinlv/gd/blob/main/README.md"
    echo -e "如果需要重新部署，请复制以下命令执行："
    echo -e "rm -rf  ${QLMainPath}/jbot/*  &&   bash  install.sh\n"
    exit 0
fi
gitPull
echo -e "\n*******************\n所需环境已部署完成\n*******************\n"
echo -e "请前往面板【配置文件】配置tg机器人参数，再启动机器人即可。\n参考本仓库第3-4步: https://github.com/curtinlv/gd/blob/main/README.md "
