#!/bin/bash

echo 'this is a app_info.sh'

nginx_server='http://175.27.236.167'
mongodb='175.27.236.167'

Nginx_info(){
  status_code=$(curl -I -m 10 -o /dev/null -s -w %{http_code} $nginx_server)
  if [ $status_code -eq 000 -o $status_code -ge 500 ]; then
    echo 'NGINX SERVER ERROR'
    echo 'STATUS CODE : ' $status_code
  else
    echo 'NGINX SERVER OK'
    curl  $nginx_server > /tmp/nginx_status
    cat /tmp/nginx_status
    rm -f /tmp/nginx_status
  fi
}



#Nginx_info
Mongodb_info