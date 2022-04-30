# Debian Installation
FROM	debian

# OS Package Updates
RUN	apt-get update
RUN	apt-get -y upgrade

# SSH Installation
RUN	apt-get install -y openssh-server
COPY	./sshd_config /etc/ssh/sshd_config
RUN	echo 'root:root' | chpasswd

# Tor Installation
RUN	apt-get install -y tor

# Ports
EXPOSE	22

# Init Container
CMD	service ssh start && \
	tor
