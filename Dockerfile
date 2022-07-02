FROM alpine
FROM klud/gitlab-runner
FROM node:14.19.0-alpine
RUN npm install -g cnpm --registry=https://registry.npmmirror.com
