# Use python3.9 base image
FROM python:3.9-slim-buster

# we don't have an interactive Term
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /ilham/

# http://bugs.python.org/issue19846
ENV LANG C.UTF-8


RUN apt-get autoremove --purge
RUN apt-get update && apt upgrade -y && apt-get install sudo apt-utils -y # buildkit
RUN apt-get install -y bash \
    build-essential \
    cmake \
    curl \
    debian-archive-keyring \
    debian-keyring \
    ffmpeg \
    gcc \
    git \ 
    gnupg \
    jq \
    libatlas-base-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavfilter-dev \    
    libavformat-dev \      
    libavutil-dev \  
    libboost-python-dev \  
    libcurl4-openssl-dev \
    libffi-dev \ 
    libgconf-2-4 \
    libgtk-3-dev \
    libjpeg-dev \ 
    libjpeg62-turbo-dev \
    libopus-dev \
    libopus0 \
    libpq-dev \
    libreadline-dev \
    libswresample-dev \
    libswscale-dev \
    libssl-dev \
    libwebp-dev \
    libx11-dev \
    libxi6 \
    libxml2-dev \ 
    libxslt1-dev \  
    libyaml-dev \   
    linux-headers-amd64 \
    make \
    mediainfo \
    megatools \
    meson \
    musl \
    musl-dev \
    neofetch \
    netcat \
    ninja-build \
    openssh-client \
    openssh-server \
    openssl \
    p7zip-full \
    pdftk \
    pkg-config \
    procps \
    python3-dev \
    texinfo \
    unzip \
    util-linux \
    wget \
    wkhtmltopdf \
    xvfb \
    yasm \
    zip \
    zlib1g \
    zlib1g-dev

RUN pip3 install --upgrade pip setuptools 
RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 
RUN if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi 
RUN rm -r /root/.cache
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install -y ./google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb
RUN wget https://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && chmod +x chromedriver && mv -f chromedriver /usr/bin/ && rm chromedriver_linux64.zip
RUN git clone https://github.com/ilhammansiz/PandaX_Userbot /root/PandaX_Userbot
RUN mkdir /root/PandaX_Userbot/bin/
WORKDIR /root/PandaX_Userbot/
RUN chmod +x /usr/local/bin/*
RUN pip3 install -r requirements.txt
