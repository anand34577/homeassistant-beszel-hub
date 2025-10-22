ARG BUILD_FROM
FROM henrygd/beszel:latest

# Set default timezone
ENV TZ=Asia/Kolkata

# Copy wrapper script with executable permissions (no RUN needed!)
COPY --chmod=755 start.sh /start.sh

# Use wrapper script
CMD ["/start.sh"]

# Labels
LABEL \
    io.hass.name="Beszel Hub" \
    io.hass.description="Lightweight server monitoring hub" \
    io.hass.type="addon" \
    maintainer="Anand <your.email@example.com>"
