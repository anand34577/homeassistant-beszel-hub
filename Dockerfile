ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Labels
LABEL \
  io.hass.name="Beszel Hub" \
  io.hass.description="Lightweight server monitoring hub" \
  io.hass.type="addon" \
  io.hass.version="${BUILD_VERSION}" \
  maintainer="Your Name <[email protected]>" \
  org.opencontainers.image.title="Beszel Hub" \
  org.opencontainers.image.description="Lightweight server monitoring hub with Docker statistics" \
  org.opencontainers.image.vendor="Home Assistant Add-ons" \
  org.opencontainers.image.authors="Your Name <[email protected]>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.url="https://github.com/your-username/hassio-addons" \
  org.opencontainers.image.source="https://github.com/henrygd/beszel" \
  org.opencontainers.image.documentation="https://beszel.dev"

# Copy root filesystem
COPY run.sh /
RUN chmod a+x /run.sh

# Set working directory
WORKDIR /beszel_data

CMD ["/run.sh"]
