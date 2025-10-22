ARG BUILD_FROM
FROM henrygd/beszel:latest

# Copy startup script
COPY run.sh /

# Make script executable
RUN chmod a+x /run.sh

# Use our custom startup script
CMD ["/run.sh"]

# Labels
LABEL \
    io.hass.name="Beszel Hub" \
    io.hass.description="Lightweight server monitoring hub" \
    io.hass.type="addon" \
    maintainer="Anand <anand34577@example.com>"
