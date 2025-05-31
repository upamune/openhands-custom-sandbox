FROM ghcr.io/all-hands-ai/runtime:0.39-nikolaik

# Install essential packages
RUN apt-get update && apt-get install -y \
    # Basic tools
    curl \
    wget \
    git \
    unzip \
    zip \
    tar \
    gzip \
    # Development tools
    build-essential \
    pkg-config \
    make \
    # Editors
    vim \
    nano \
    # System/file management
    lsof \
    # Authentication & security 
    ca-certificates \
    gnupg \
    apt-transport-https \
    # Shell improvements
    bash-completion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV AQUA_ROOT_DIR=/opt/aquaproj-aqua
ENV AQUA_GLOBAL_CONFIG_DIR=/etc/aquaproj-aqua
ENV AQUA_GLOBAL_CONFIG=/etc/aquaproj-aqua/aqua.yaml
ENV PATH="${AQUA_ROOT_DIR}/bin:${PATH}"

# Node.js environment variables
ENV XDG_DATA_HOME=/opt/xdg-data
ENV NPM_CONFIG_PREFIX="${XDG_DATA_HOME}/npm-global"
ENV PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"

# Set working directory
WORKDIR /work

# Create necessary directories
RUN mkdir -p ${NPM_CONFIG_PREFIX}/bin

# Bash configuration
COPY config/bashrc /root/.bashrc

# Copy and run aqua installation script
COPY scripts/setup-aqua.sh /tmp/
RUN chmod +x /tmp/setup-aqua.sh && /tmp/setup-aqua.sh

# Copy aqua global configuration
RUN mkdir -p ${AQUA_GLOBAL_CONFIG_DIR}
COPY config/aqua.yaml ${AQUA_GLOBAL_CONFIG_DIR}/aqua.yaml
COPY config/aqua-checksums.json ${AQUA_GLOBAL_CONFIG_DIR}/aqua-checksums.json

# Install tools with aqua
RUN aqua i -a

CMD ["/bin/bash"]
