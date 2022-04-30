# Debian Installation
FROM	debian

# OS Package Updates
RUN	apt-get update
RUN	apt-get -y upgrade

# Nginx Installation
RUN	apt-get install -y nginx

# SSH Installation
RUN	apt-get install -y openssh-server
COPY	./sshd_config /etc/ssh/sshd_config
RUN	echo 'root:root' | chpasswd

# Tor Installation
RUN	apt-get install -y tor
COPY	./torrc /etc/tor/torrc

# Ports
EXPOSE	22
EXPOSE	80

# Init Container
CMD	service nginx start	&& \
	service ssh start	&& \
	tor
