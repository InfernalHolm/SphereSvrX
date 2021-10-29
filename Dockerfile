FROM debian:stable-slim

ENV MYSQL_VERSION=5.7
ENV LIBMYSQL_DEB_VERSION=libmysqlclient20_5.7.36-0ubuntu0.18.04.1_amd64

RUN mkdir /sphere

# Install dependencies
RUN apt update \
  && apt install -y \
    curl \
    mysql-common \
  && rm -rf /var/lib/apt/lists/*

# SphereServer X requires libmysqlclient.so.20
RUN curl -LO "http://security.ubuntu.com/ubuntu/pool/main/m/mysql-$MYSQL_VERSION/$LIBMYSQL_DEB_VERSION.deb" \
  && dpkg -i $LIBMYSQL_DEB_VERSION.deb \
  && rm -f $LIBMYSQL_DEB_VERSION.deb

# Install SphereServer X
RUN curl -L -o sphereserver.tar.gz "https://forum.spherecommunity.net/sshare.php?downproj=64" \
  && tar -xzf sphereserver.tar.gz -C /sphere \
  && cp /sphere/build-64/bin64/SphereSvrX64_nightly /sphere/spheresvr \
  && rm -rf sphereserver.tar.gz /sphere/build-64

# Clean up
RUN apt-get remove --purge -y curl \
  && apt-get autoremove -y \
  && apt-get clean

# Agree with nightly build
WORKDIR /sphere
EXPOSE 2593
CMD "./spheresvr"
