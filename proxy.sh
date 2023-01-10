#!/bin/bash

###
# Both of "prxoy_on" and "proxy_off" can be used in bash for prxoy.
###

# Set proxy
proxy_set(){
   PROXY_ENV="http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
   for envar in $PROXY_ENV
   do
      export $envar=$1
   done
   for envar in "no_proxy NO_PROXY"
   do
      export $envar=$2
   done
}

# Disable proxy
proxy_off(){
    PROXY_ENV="http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
    for envar in $PROXY_ENV
    do
       unset $envar
    done
}

# Enable proxy
proxy_on(){
   ip_origin=$( curl -s ip.gs )
   proxy_value="http://192.168.31.95:9110"
   no_proxy_value="localhost,127.0.0.1,LocalAddress,LocalDomain.com"
   proxy_set $proxy_value $no_proxy_value
   
   ip_proxy=$( curl -s ip.gs )
   if [[ -z $ip_proxy || $ip_origin == $ip_proxy ]]; then
     echo "proxy failed. ip_origin:${ip_origin} ip_proxy:${ip_proxy}"
     proxy_off

     return
   fi

   echo "proxy success"
}
