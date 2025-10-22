ARG BUILD_FROM=henrygd/beszel:0.7.0
FROM ${BUILD_FROM}

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_VERSION

# Labels
LABEL \
  io.hass.name="${BUILD_NAME}" \
  io.hass.description="${BUILD_DESCRIPTION}" \
  io.hass.arch="${BUILD_ARCH}" \
  io.hass.type="addon" \
  io.hass.version="${BUILD_VERSION}" \
  maintainer="Anand"

# The image already has:
# ENTRYPOINT ["/beszel"]
# CMD ["serve", "--http=0.0.0.0:8090"]
# So we don't need to override anything
