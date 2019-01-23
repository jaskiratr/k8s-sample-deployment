#!/bin/bash

# Nginx config
sed -e "s/PLACEHOLDER_POSTMATE_CMS_SERVER/${POSTMATE_CMS_SERVER}/g"  "nginx/nginx-template.conf" > "/etc/nginx/nginx.conf" 

if [ "$POSTMATE_PROFILE_ACTIVE" = "production" ]
then
  npm run build
  service nginx restart
  npm run start
else
  service nginx restart
  npm run dev
fi