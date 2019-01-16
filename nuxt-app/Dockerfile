FROM node:10.7

# Install app dependencies
RUN apt-get update
RUN apt-get install nano nginx -y

# Copy nginx configuration
COPY nginx/nginx.conf /etc/nginx/

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN npm install
RUN npm rebuild node-sass

ENV HOST 0.0.0.0
EXPOSE 3000

# Run nginx server and also nuxt server
CMD service nginx restart && npm run dev