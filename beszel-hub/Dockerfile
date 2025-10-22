ARG BUILD_FROM=ghcr.io/hassio-addons/base:16.3.3
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install Beszel Hub
ARG BESZEL_VERSION="0.7.3"
RUN \
    set -x \
    && apk add --no-cache \
        curl \
        ca-certificates \
    && mkdir -p /data/beszel_data \
    && ARCH=$(uname -m) \
    && case "$ARCH" in \
        x86_64) BESZEL_ARCH="amd64" ;; \
        aarch64) BESZEL_ARCH="arm64" ;; \
        armv7l) BESZEL_ARCH="armv7" ;; \
        armhf) BESZEL_ARCH="armv6" ;; \
        i386) BESZEL_ARCH="386" ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac \
    && curl -L "https://github.com/henrygd/beszel/releases/download/v${BESZEL_VERSION}/beszel_${BESZEL_VERSION}_linux_${BESZEL_ARCH}.tar.gz" \
        -o /tmp/beszel.tar.gz \
    && tar -xzf /tmp/beszel.tar.gz -C /usr/local/bin/ \
    && chmod +x /usr/local/bin/beszel \
    && rm -f /tmp/beszel.tar.gz

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION}
