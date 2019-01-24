#!/bin/bash

if [ "$POSTMATE_ENVIRONMENT" = "production" ]
then
  # Nginx server
  sed -e "s/PLACEHOLDER_POSTMATE_CMS_SERVER/postmate-cms.default.svc.cluster.local/g"  "nginx/nginx-template.conf" > "/etc/nginx/nginx.conf" 
  service nginx restart
  # Nuxt application
  npm run build
  npm run start
else
  # Nginx server
  sed -e "s/PLACEHOLDER_POSTMATE_CMS_SERVER/postmate-cms/g"  "nginx/nginx-template.conf" > "/etc/nginx/nginx.conf" 
  service nginx restart
  # Nuxt application
  npm run dev
fi