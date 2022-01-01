# nginx-build

## Install

- Download modules
- Copy modules to /etc/nginx/modules/
- Copy modules-availble/ngx_wanted_module to /etc/nginx/modules-enabled 
- Add changes to the templates used or nginx.conf depending on changes wanted and how you want to use them 
- Restart nginx

## Updating

- Modules need a rebuild of after each Nginx version update. Sadly it is not possible to update Nginx unless the modules are build first. At a feature point I might working on costum nginx package that includes the modules. 