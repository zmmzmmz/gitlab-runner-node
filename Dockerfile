FROM alpine:3.10
# arm node
FROM arm32v7/node:14
RUN npm install -g cnpm --registry=https://registry.npmmirror.com

COPY entrypoint /
RUN set -eux; \
    \
    adduser -D -S -h /home/gitlab-runner gitlab-runner && \
    apk add --no-cache \
    dumb-init=1.2.2-r1 \
    bash \
    ca-certificates \
    git \
    openssl \
    tzdata \
    git-lfs \
    wget && \
    wget -q "https://gitlab-runner-downloads.s3.amazonaws.com/v13.10.0/binaries/gitlab-runner-linux-arm" -O /usr/bin/gitlab-runner && \
    chmod +x /usr/bin/gitlab-runner && \
    ln -s /usr/bin/gitlab-runner /usr/bin/gitlab-ci-multi-runner && \
    gitlab-runner --version && \
    mkdir -p /etc/gitlab-runner/certs && \
    chmod -R 700 /etc/gitlab-runner && \
    wget -q "https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-Linux-armhf" -O /usr/bin/docker-machine && \
    chmod +x /usr/bin/docker-machine && \
    chmod +x /entrypoint && \
    docker-machine --version && \
    dumb-init --version && \
    git-lfs install --skip-repo && \
    git-lfs version
STOPSIGNAL SIGQUIT
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]