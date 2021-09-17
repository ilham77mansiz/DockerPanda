# Use python3.9 base image
FROM python:3.9-slim-buster

# we don't have an interactive Term
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /ilham/

# http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt -qq update && apt -qq upgrade -y
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
    zlib1g-dev \

# Install google chrome
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get -qq update && apt-get -qq install -y google-chrome-stable

# Install chromedriver
RUN wget -N https://chromedriver.storage.googleapis.com/87.0.4280.88/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    mv -f ~/chromedriver /usr/bin/chromedriver && \
    chown root:root /usr/bin/chromedriver && \
    chmod 0755 /usr/bin/chromedriver

# Install python requirements
ADD https://raw.githubusercontent.com/ilham77mansiz/-PETERCORD-/Petercord-Userbot/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash"]
