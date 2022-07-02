FROM alpine
# arm runner
FROM klud/gitlab-runner
# arm node
FROM arm32v7/node:14
RUN npm install -g cnpm --registry=https://registry.npmmirror.com

VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]