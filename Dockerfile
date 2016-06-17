FROM ubuntu:14.04
MAINTAINER Boris Drazhzhov "templar8@gmail.com"
RUN apt-get update && \
	apt-get install -y git curl build-essential \
	gawk libreadline6-dev zlib1g-dev libssl-dev libyaml-dev \
	libsqlite3-dev sqlite3 autoconf libgmp-dev libgdbm-dev libncurses5-dev \
	automake libtool bison pkg-config libffi-dev libpq-dev && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	useradd -ms /bin/bash app
WORKDIR /home/app
USER app
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
	\curl -sSL https://get.rvm.io | bash -s stable --ruby && \
	/bin/bash -l -c "rvm cleanup all" && \
	/bin/bash -l -c "gem install --no-rdoc --no-ri bundler"

