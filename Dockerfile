FROM alpine
# arm runner
FROM klud/gitlab-runner
# arm node
FROM arm32v7/node:14.19.3
RUN npm install -g cnpm --registry=https://registry.npmmirror.com
