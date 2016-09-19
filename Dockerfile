FROM ubuntu 
ADD . /usr/share/antigen-docker
WORKDIR /usr/share/antigen-docker
RUN apt-get update && apt-get install --assume-yes -y git-core gcc \
  libgdbm3 libgdbm-dev make autoconf yodl libncursesw5-dev \
  texinfo checkinstall
RUN matrix.sh 
