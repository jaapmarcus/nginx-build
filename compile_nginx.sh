#!/bin/bash 

#set versions
nginx_version="1.21.5"
zlib_version="1.2.11"

apt-get update
apt-get install wget git make gcc -y

cd ./
wget "https://nginx.org/download/nginx-$nginx_version.tar.gz" -O - | tar -xz

# nginx_cache_purge
git clone https://github.com/nginx-modules/ngx_cache_purge

# brotili 
git clone --recurse-submodules https://github.com/google/ngx_brotli.git 

# Download zlib
wget "https://zlib.net/zlib-$zlib_version.tar.gz" -O - | tar -xz

cd ./nginx-$nginx_version/

./configure --with-compat --add-dynamic-module=../ngx_brotli --with-zlib=../zlib-1.2.11 --add-dynamic-module=../ngx_cache_purge
make modules
cd ..
tar -cvf ./modules.tar.gz ./nginx-$nginx_version/objs/*.so