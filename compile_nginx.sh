#!/bin/bash 

#set versions
nginx_version="1.21.5"
zlib_version="1.2.12"
pcre_version="10.39"
openssl_version="3.0.2"


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
wget "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$pcre_version/pcre2-$pcre_version.tar.gz" -O - | tar -xz
wget "https://www.openssl.org/source/openssl-$openssl_version.tar.gz" -O - | tar -xz


cd ./nginx-$nginx_version/

./configure --with-compat --add-dynamic-module=../ngx_brotli --with-zlib=../zlib-$zlib_version --add-dynamic-module=../ngx_cache_purge --with-pcre=../pcre2-$pcre_version --with-openssl=../openssl-$openssl_version 
make modules
cd ..
tar -cvf ./modules.tar.gz ./nginx-$nginx_version/objs/*.so