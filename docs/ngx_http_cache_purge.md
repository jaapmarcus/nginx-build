# ngx_http_purge.md 

Originally made by @FRiCKLE (https://github.com/FRiCKLE/ngx_cache_purge) 

# Usage 

See attached template

## Warning

Currently everything is in early development state!

## Proxy cache

Currently the only method to cache a file is with CURL -X PURGE https://domain.com

Please not cached file needs exists otherwise it will return a 412 error code

## Fastcgi cache

For Wordpress https://wordpress.org/plugins/nginx-helper/ seems to work fine unless you want to purge all. As Hestia PHP user is the user instead of www-data 

