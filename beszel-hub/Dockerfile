ARG BUILD_FROM
FROM henrygd/beszel:latest

# Set default timezone
ENV TZ=Asia/Kolkata

# Copy wrapper script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Use wrapper script
CMD ["/start.sh"]

# Labels
LABEL \
    io.hass.name="Beszel Hub" \
    io.hass.description="Lightweight server monitoring hub" \
    io.hass.type="addon" \
    maintainer="Anand <anand34577@example.com>"
