#!/bin/bash
wppath='{{ wordpress_web_dir}}'
htuser='{{ apache2_http_user }}'
htgroup='{{ apache2_http_user }}'

printf "chmod Files and Directories\n"
find ${wppath}/ -type f -print0 | xargs -0 chmod 0644
find ${wppath}/ -type d -print0 | xargs -0 chmod 0755

printf "chown Directories\n"
chown -R ${htuser}:${htgroup} ${wppath}/
