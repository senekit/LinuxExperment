#!/bin/bash
#清除控制台
clear

# 获取系统信息
# 获取cpu数量
get_cpu_num(){
    grep "cpu cores" /proc/cpuinfo | head -n1 | awk '{ print $NF }'
}

# 获取总内存
get_memory_total(){
    free -h | awk 'NR==2{ print $2 }'
}

# 获取可用内存
get_memory_free(){
    free -m | awk 'NR==2{ print $NF }'
}

# 获取挂载到根目录的文件系统的总大小
get_disk_size(){
    df -h | grep -E "^.*/$" | awk '{ print $2 }'
}

# 获取系统位数
get_system_bit(){
    getconf LONG_BIT
}

# 获取当前系统正在运行的进程数
get_process(){
    ps aux | tail -n +2 | wc -l
}

# 获取已安装的软件包数量
get_software_num(){
    dpkg -l | tail -n +6 | wc -l
}

# 获取ip
get_ip(){
    ip a s | grep -w "inet" | awk 'NR==2{ print $2 }' | awk -F/ '{ print $1 }'
}


#输出结果
echo "cpu num: $(get_cpu_num)"
echo "memory total: $(get_memory_total)"
echo "memory free: $(get_memory_free)M"
echo "disk size: $(get_disk_size)"
echo "system bit: $(get_system_bit)"
echo "process: $(get_process)"
echo "software num: $(get_software_num)"
echo "ip: $(get_ip)"

