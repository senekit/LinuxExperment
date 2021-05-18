#!/bin/bash

reset_terminal=$(tput sgr0)
# 重新设置终端为正常屏幕
declare -A script_array
# 声明数组
i=1
# 脚本个数
tips=""
# 用户可选择 1 2 3 3种脚本

# 在当前目录下
for script_file in `ls -I monitor.sh `
do
  echo -e '\e[1;35m' "The Script:" ${i} '=>' ${reset_terminal} ${script_file}
  # -e设置颜色， 后边指明各个数字对应的脚本
  script_array[$i]=${script_file}
  tips="${tips} or ${i}"
  #为每个脚本新增tip
  i=$((i+1))
done

while true
do
  #读入用户指令
  read -p "Please INPUT a number [${tips}] (0:exit):" choice
  #输入非数字
  if [[ ! ${choice} =~ ^[0-9]+ ]]; then
    echo "input is not a Number!"
  else
    #退出指令
    if [ ${choice} -eq 0 ]; then
      echo "Bye"
      exit 0
    # 超出1-3
    elif [ ${choice} -lt 1 ] || [ ${choice} -gt 3 ]; then
      echo 'input number between 1-3'
    else
    #执行目标脚本
      /bin/sh ./${script_array[$choice]}
    fi
  fi
done

