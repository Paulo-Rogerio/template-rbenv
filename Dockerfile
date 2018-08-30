# Ultima versao LTS
FROM       ubuntu:bionic 

MAINTAINER Paulo Rogério "psilva.gomes.rogerio@gmail.com"

# Variaveis de Ambiente
ENV       LANG C.UTF-8
ENV       DEBIAN_FRONTEND noninteractive

RUN       apt-get update -yq && \
          apt-get upgrade -yq && \
          apt-get install -yq --no-install-recommends \
            software-properties-common \
            apt-transport-https \
	          wget \
            lsb-core \
            gnupg \ 
            ca-certificates \
            curl \
            unzip \
            apt-utils

# Repo PostgreSQL
RUN       echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list 
RUN       wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Repo Chrome
RUN       wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN       echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Repo Node
RUN      echo "deb https://deb.nodesource.com/node_8.x bionic main" > /etc/apt/sources.list.d/nodesource.list
RUN      echo "deb-src https://deb.nodesource.com/node_8.x bionic main" >> /etc/apt/sources.list.d/nodesource.list
RUN      curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

# Install Pacotes
RUN       apt-get update -yq && \
          apt-get install -yq \
            build-essential \
            libffi-dev \
            zlib1g-dev \
            libssl-dev \
            libreadline-dev \
            libyaml-dev \
            libpq-dev \
            libmysqlclient-dev \
            libsqlite3-dev \
            libssl-doc \
            sqlite3 \
            libxml2-dev \
            libxslt1-dev \
            libgdbm-dev \
            libncurses5-dev \
            libcurl4-openssl-dev \
            libffi-dev \
            nodejs \
            net-tools \
            vim \
            git \
            apt-transport-https \
            vim \
            postgresql-10 \
            dirmngr \
            gnupg \
            openssh-client \
            openjdk-8-jdk \
            nginx \
            autoconf \
            bison \
            libssl-dev \ 
            libyaml-dev \
            libreadline6-dev \
            zlib1g-dev \
            libncurses5-dev \
            libffi-dev \
            rsyslog \
            rsyslog-gnutls \
            nginx \
            wkhtmltopdf \
            libfontconfig1 \
            libfontconfig1-dev \
            xvfb \
            fluxbox

# Dependencias para Protrector
RUN 	  apt-get update -yq && \
          apt-get -yq install \
            sudo \ 
            fonts-ipafont-gothic \
            xfonts-100dpi \
            xfonts-75dpi \
            xfonts-cyrillic \
            xfonts-scalable \
            x11-apps \
            ttf-ubuntu-font-family \
            libfreetype6 \
            libfontconfig


# Update openssl 
RUN 	  apt-get update -yq && \
          apt-get -yq install \
            openssl1.0 \
            libssl1.0-dev 

# Pacotes protrector pos install dependencias
RUN 	  apt-get update -yq && \
          apt-get -yq install \
            software-properties-common \
            python3-software-properties

# Latest Ubuntu Firefox, Google Chrome, XVFB and JRE installs
RUN      apt-get update -yq && \
         apt-get -yq install \
    	    xvfb \
    	    firefox \
            firefox-locale-pt \
    	    google-chrome-stable \
    	    default-jre

RUN      apt-mark hold firefox

# Copy scripts
RUN 	 mkdir -p ./scripts-bash
COPY     ./scripts-bash /scripts-bash
RUN      chmod +x /scripts-bash/*.sh
RUN      cp /scripts-bash/x11_server.sh /root

# Install
RUN      /scripts-bash/install.sh

# Variaveis de Ambiente
ENV       RBENV_ROOT /root/.rbenv
ENV       PATH "$RBENV_ROOT/bin:$RBENV_ROOT/shims:$RBENV_ROOT/libexec:$RBENV_ROOT/plugins/ruby-build/bin:$PATH"
RUN       eval "$(rbenv init -)"

RUN       mkdir -p /app
WORKDIR   /app
VOLUME    ["/app"]

# Clean
RUN      /scripts-bash/clean.sh

ENTRYPOINT [ "/root/x11_server.sh" ]
