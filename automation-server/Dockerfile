#
# Extentx + MongoDB + Nodejs Dockerfile
#
# Pull base image.
FROM ubuntu:14.04

# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
  echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list && \
  apt-get update && \
  sudo apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/data/db"]

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

# Install Node.js
RUN sudo apt-get -qq update
RUN sudo apt-get -qq -y install curl
RUN sudo apt-get install -y npm
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

# Get ExtendX
RUN sudo apt-get install -y git
RUN git clone https://github.com/anshooarora/extentx

# Define working directory.
WORKDIR /extentx

RUN npm install

# Install Sails.js
RUN npm -g install -y sails
EXPOSE 1337

# Run Mongod and Extent Server
COPY start.sh start.sh
RUN chmod 777 start.sh
ENTRYPOINT ["./start.sh"]
