#!/bin/bash 

#set versions
nginx_version="1.21.4"
zlib_version="1.2.11"



wget "https://nginx.org/download/nginx-$nginx_version.tar.gz" | tar -xf

# nginx_cache_purge
git clone https://github.com/nginx-modules/ngx_cache_purge

# brotili 
git clone https://github.com/google/ngx_brotli.git

# Download zlib
wget "https://zlib.net/zlib-$zlib_version.tar.gz" | tar -xf

cd ./nginx-$nginx_version/

./configure --with-compat --add-dynamic-module=../ngx_brotli --with-zlib=../zlib-1.2.11 --add-dynamic-module=../ngx_cache_purge
make modules 
tar -xcvf modules.tar.gz ./objs/*.so