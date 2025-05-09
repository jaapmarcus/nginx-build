#!/bin/bash 

#set versions
nginx_version="1.28.0"
zlib_version="1.3.1"
pcre_version="10.45"
openssl_version="3.5.0"

# Install dependencies
apt-get update
apt-get install wget git make gcc -y

cd ./
wget "https://nginx.org/download/nginx-$nginx_version.tar.gz" -O - | tar -xz

# ngx_devel_kit
git clone https://github.com/vision5/ngx_devel_kit.git

# ngix set-misc-nginx-module
git clone https://github.com/openresty/set-misc-nginx-module.git
# nginx_cache_purge
git clone https://github.com/nginx-modules/ngx_cache_purge.git

#nginx-ts-module
git clone https://github.com/arut/nginx-ts-module.git

# Download zlib
wget "https://github.com/madler/zlib/archive/refs/tags/v$zlib_version.tar.gz" -O - | tar -xz
wget "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$pcre_version/pcre2-$pcre_version.tar.gz" -O - | tar -xz
wget "https://www.openssl.org/source/openssl-$openssl_version.tar.gz" -O - | tar -xz


cd ./nginx-$nginx_version/

./configure --prefix=/usr/local/nginx --sbin-path=/usr/sbin/nginx \
 --with-http_mp4_module --with-http_auth_request_module --with-http_dav_module \
 --with-http_geoip_module --with-http_gzip_static_module --with-http_v2_module \
 --with-stream --with-stream_ssl_preread_module --with-threads --with-file-aio \
 --with-http_addition_module --with-http_stub_status_module --with-http_ssl_module \
 --with-http_realip_module --with-http_sub_module --with-http_gzip_static_module \
 --with-pcre=../pcre2-$pcre_version --with-http_xslt_module --with-http_secure_link_module \
 --with-openssl=../openssl-$openssl_version --with-zlib=../zlib-$zlib_version \
 --add-module=../nginx-ts-module  --add-module=../ngx_devel_kit --add-module=../set-misc-nginx-module \
 --without-http_uwsgi_module --without-http_scgi_module

make -j $(nproc)
make install

