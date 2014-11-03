# DOCKER-VERSION 0.3.4

FROM    centos:centos6

# enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# install Node.js and npm
RUN     yum install -y npm

# bundle source
COPY . /src

# install app dependencies
RUN cd /src; npm install

# expose the service port
EXPOSE 8181

# start the service
CMD ["node", "/src/index.js"]

