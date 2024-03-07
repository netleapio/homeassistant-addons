ARG BUILD_FROM
FROM $BUILD_FROM

# Add mosquitto client
RUN \
  apk add --no-cache \
    mosquitto-clients \
    git \
  && wget https://go.dev/dl/go1.22.0.linux-arm64.tar.gz -O go1.22.0.linux-arm64.tar.gz \
  && tar -C /usr/local -xzf go1.22.0.linux-arm64.tar.gz \
  && rm go1.22.0.linux-arm64.tar.gz

# Add controller binary
RUN /usr/local/go/bin/go install github.com/netleapio/zappy-controller@v0.1.1

# Copy wrapper script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]