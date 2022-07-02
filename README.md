# gitlab-runner-node
Gitlab-runner with node

## 构建镜像

```bash
docker build -t gitlab-runner-node:v1 .
```

## 发布镜像
```bash
# 1. 登录阿里云 Docker Registry
$ docker login --username=$Account registry.cn-hangzhou.aliyuncs.com
$ docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/xxxx/xxxx:[镜像版本号]
$ docker push registry.cn-hangzhou.aliyuncs.com/xxxx/xxxx:[镜像版本号]
```