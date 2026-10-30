FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Enable 32-bit architecture and universe repository
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
    software-properties-common \
     && add-apt-repository universe && \
    apt-get update && apt-get install -y \
    wget \
    unzip \
    bzip2 \
    build-essential \
    libc6:i386 \
    libstdc++6:i386 \
    libusb-0.1-4 \
    libusb-1.0-0 \
    libgconf-2-4 \
    libtinfo5 \
    python2 \
    libpython2.7 \
    python3 \
    libncurses5 \
    libxtst6 \
    libxi6 \
    libgtk-3-0 \
    libcanberra-gtk-module \
    libx11-xcb1 \
    libxrandr2 \
    libxss1 \
    libasound2 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libfreetype6 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libpango-1.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxinerama1 \
    libxshmfence1 \
    udev \
    libnss3 \
    libnspr4 \
    libgbm1 \
    libdrm2 \
    gcc-msp430 \
    mspdebug \
    gdb-msp430 \
    && rm -rf /var/lib/apt/lists/*

# Add Deadsnakes PPA to install Python 3.9 and its library package
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.9 libpython3.9 && \
    rm -rf /var/lib/apt/lists/*

# Create a workspace directory inside the container
WORKDIR /workspace

CMD ["/bin/bash"]
