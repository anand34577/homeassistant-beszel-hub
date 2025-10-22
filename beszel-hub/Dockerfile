ARG BUILD_FROM
FROM henrygd/beszel:latest

# Copy wrapper script with executable permissions
COPY --chmod=755 start.sh /start.sh

# Use wrapper script
CMD ["/start.sh"]

# Labels
LABEL \
    io.hass.name="Beszel Hub" \
    io.hass.description="Lightweight server monitoring hub" \
    io.hass.type="addon" \
    maintainer="Your Name <your.email@example.com>"
