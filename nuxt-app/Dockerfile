# FROM nginx:1.14.1-alpine

# ## Copy our default nginx config
# COPY nginx/default.conf /etc/nginx/conf.d/

# ## Remove default nginx website
# RUN rm -rf /usr/share/nginx/html/*

# # RUN apt-get install curl python-software-properties
# RUN curl -sL https://deb.nodesource.com/setup_10.x | -E bash -
# # RUN apt-get install nodejs

# CMD ["nginx", "-g", "daemon off;"]

FROM node:10.7

# Install app dependencies
# RUN apk update && apk upgrade && apk add git
RUN apt-get update
# RUN apt-get install apt-transport-https ca-certificates -y
RUN apt-get install nano nginx -y
# COPY nginx/default.conf /etc/nginx/conf.d/
COPY nginx/nginx.conf /etc/nginx/

# RUN service nginx restart

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN npm install
RUN npm rebuild node-sass

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD service nginx restart && npm run dev
# [ "npm", "run", "dev" ]

# RUN apt-get install sudo -y
# RUN sudo ufw allow 'Nginx Full'
# RUN systemctl status nginx


# # Create app directory
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# RUN apk add --no-cache make gcc g++ python && \
#   npm install --production --silent && \
#   apk del make gcc g++ python



# FROM nginx:1.14.1-alpine

# ## Copy our default nginx config
# COPY nginx/default.conf /etc/nginx/conf.d/

# ## Remove default nginx website
# RUN rm -rf /usr/share/nginx/html/*

# ## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
# # COPY --from=build-stage /ng-app/dist /usr/share/nginx/html

# COPY . /usr/src/app/

# RUN npm install
# RUN npm rebuild node-sass

# ENV HOST 0.0.0.0
# EXPOSE 3000

# # start command
# RUN npm run dev

# CMD ["nginx", "-g", "daemon off;"]


# -------

# FROM node:10.7

# # Install app dependencies
# # RUN apk update && apk upgrade && apk add git
# RUN apt-get update && apt-get install nano -y

# # Create app directory
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# # RUN apk add --no-cache make gcc g++ python && \
# #   npm install --production --silent && \
# #   apk del make gcc g++ python

# COPY . /usr/src/app/

# RUN npm install
# RUN npm rebuild node-sass

# ENV HOST 0.0.0.0
# EXPOSE 3000

# # start command
# CMD [ "npm", "run", "dev" ]
