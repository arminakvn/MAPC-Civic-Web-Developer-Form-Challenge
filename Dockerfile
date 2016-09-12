FROM node:argon
# RUN apt-get update -qq && apt-get upgrade -y
ADD package.json npm-shrinkwrap.json* /usr/src/app/
ADD scripts/. /usr/src/app/scripts
ADD bower_components/. /usr/src/app/bower_components
ADD server/. /usr/src/app/server
ADD stylesheets/. /usr/src/app/stylesheets
ADD index.html/. /usr/src/app/index.html
WORKDIR /usr/src/app
RUN npm --unsafe-perm install
ADD server/app.js /usr/src/app/app.js
ADD server/cluster.js /usr/src/app/cluster.js
EXPOSE 8080
CMD [ "npm", "start" ]
