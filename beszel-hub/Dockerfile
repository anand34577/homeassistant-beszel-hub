ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base:7.3.3
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install Beszel Hub
ARG BESZEL_VERSION=0.7.0
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
    && ARCH="$(dpkg --print-architecture)" \
    && case "${ARCH}" in \
        amd64) BESZEL_ARCH='amd64' ;; \
        arm64) BESZEL_ARCH='arm64' ;; \
        armhf) BESZEL_ARCH='armv7' ;; \
        *) echo "Unsupported architecture: ${ARCH}"; exit 1 ;; \
    esac \
    && wget -O /tmp/beszel.tar.gz \
        "https://github.com/henrygd/beszel/releases/download/v${BESZEL_VERSION}/beszel_${BESZEL_VERSION}_linux_${BESZEL_ARCH}.tar.gz" \
    && tar -xzf /tmp/beszel.tar.gz -C /usr/local/bin/ \
    && chmod +x /usr/local/bin/beszel \
    && rm -rf /tmp/* \
    && apt-get purge -y --auto-remove wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy root filesystem
COPY run.sh /
RUN chmod a+x /run.sh

# Build arguments
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
  io.hass.version=${BUILD_VERSION} \
  maintainer="Anand <anand34577@github>" \
  org.opencontainers.image.title="${BUILD_NAME}" \
  org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
  org.opencontainers.image.vendor="Home Assistant Add-ons" \
  org.opencontainers.image.authors="Anand <anand34577@github>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.url="https://github.com/anand34577/homeassistant-beszel-hub" \
  org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
  org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
  org.opencontainers.image.created=${BUILD_DATE} \
  org.opencontainers.image.revision=${BUILD_REF} \
  org.opencontainers.image.version=${BUILD_VERSION}

WORKDIR /data
CMD ["/run.sh"]
