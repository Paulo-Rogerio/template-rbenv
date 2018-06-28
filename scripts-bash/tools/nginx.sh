#!/bin/bash
if [[ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]]; 
then 
    ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; 
fi

# Gzip
if [[ ! -f /etc/nginx/conf.d/_gzip.conf ]]; 
then 
    echo "gzip on;
gzip_disable "msie6";
gzip_vary on;
gzip_proxied any;
gzip_min_length    1024;
gzip_comp_level 6;
gzip_buffers 16 8k;
gzip_http_version 1.1;
gzip_types
    application/atom+xml
    application/javascript
    application/json
    application/rss+xml
    application/vnd.ms-fontobject
    application/x-font-ttf
    application/x-web-app-manifest+json
    application/xhtml+xml
    application/xml
    font/opentype
    image/svg+xml
    image/x-icon
    text/css
    text/plain
    text/x-component;" | tee /etc/nginx/conf.d/_gzip.conf >/dev/null
fi

# Navegadores
if [[ ! -f /etc/nginx/conf.d/_navegadores.default ]]; 
then 

    echo 'if ($desativa_proxy) {
    rewrite ^(.*)$ /proxy.html;
}
if ($http_user_agent ~ MSIE|Trident) {
    rewrite ^(.*)$ /chrome.html;
}' | tee /etc/nginx/conf.d/_navegadores.default >/dev/null
fi

# Worker Passenger - Default
if [[ ! -f /etc/nginx/conf.d/_performance.default ]]; 
then 
    echo "passenger_min_instances 2;" | tee /etc/nginx/conf.d/_navegadores.default >/dev/null
fi

# Proxy
if [[ ! -f /etc/nginx/conf.d/_proxy.conf ]]; 
then 
    echo 'geo $desativa_proxy {
                default 0;
                172.16.0.11 1;
                172.16.0.12 1;
}' | tee /etc/nginx/conf.d/_proxy.conf >/dev/null
fi

# Conf Default

if [[ ! -f /etc/nginx/conf.d/000-default.conf ]]; 
then 
	
     echo "server {
  listen 443 default_server;
  server_name _;

  ssl on;
  ssl_certificate      /etc/nginx/conf.d/externo.crt;
  ssl_certificate_key  /etc/nginx/conf.d/externo.key;
  ssl_protocols  SSLv2 SSLv3 TLSv1;
  ssl_ciphers  ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP;
  ssl_prefer_server_ciphers   on;
  return       404;
}" | tee /etc/nginx/conf.d/000-default.conf >/dev/null
fi


