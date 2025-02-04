FROM nginx
#RUN ["可执行文件", "参数1", "参数2"]
RUN echo '`<h1>`Hello, Docker!`</h1>`' > /usr/share/nginx/html/index.html
#COPY [--chown=`<user>`:`<group>`] <源路径>... <目标路径> --chown=`<user>`:`<group>` 选项来改变文件的所属用户及所属组。
#COPY [--chown=`<user>`:`<group>`] ["<源路径1>",... "<目标路径>"]
#ADD 指令和 COPY 的格式和性质基本一致。但是在 COPY 基础上增加了一些功能。比如 <源路径> 可以是一个 URL
#CMD 容器启动命令
#ENTRYPOINT 入口点
#ENV 设置环境变量格式有两种：ENV `<key>` `<value>`
#ENV `<key1>`=`<value1>` `<key2>`=`<value2>`...
#ARG 构建参数
#VOLUME 定义匿名卷 格式为：VOLUME ["<路径1>", "<路径2>"...]VOLUME <路径>
#docker run -d -v mydata:/data xxxx 使用了 mydata 这个命名卷挂载到了 /data 这个位
#EXPOSE 声明端口 格式为 EXPOSE <端口1> [<端口2>...]
#WORKDIR 指定工作目录 格式为 WORKDIR <工作目录路径>。cd
#USER 指定当前用户
#HEALTHCHECK 健康检查 HEALTHCHECK 支持下列选项：
#--interval=<间隔>：两次健康检查的间隔，默认为 30 秒；
#--timeout=<时长>：健康检查命令运行超时时间，如果超过这个时间，本次健康检查就被视为失败，默认 30 秒；
#--retries=<次数>：当连续失败指定次数后，则将容器状态视为 unhealthy，默认 3 次。
#LABEL 指令用来给镜像以键值对的形式添加一些元数据（metadata）LABEL `<key>`=`<value>` `<key>`=`<value>` `<key>`=`<value>` ...声明镜像作者文档地址
#SHELL 指令可以指定 RUN ENTRYPOINT CMD 指令的 shell，Linux 中默认为 ["/bin/sh", "-c"]

docker run -i -t  --mount source=xx,target=xx

docker container logs  docker container ls docker container stop docker container start docker container restart docker container rm -f

docker exec -i -t

docker export id > xx.tar

```
cat ubuntu.tar | docker import - test/ubuntu:v1.0
```

docker load

docker container prune

```
docker volume create my-vol
```

docker inspect xx

docker run -d -p 127.0.0.1:80:80 nginx:alpine docker port fa 80
-p 标记可以多次使用来绑定多个端口

docker build --build-arg VERSION=2.0 -t myimage .

## **`docker build --help` 指令解析**

## **🛠 基本语法**

```sh
docker build [OPTIONS] PATH | URL | -
```

- **`PATH`**：本地 `Dockerfile` 所在的目录（通常是 `.`）。
- **`URL`**：远程 `Git` 仓库地址。
- **`-`**：从 `stdin` 读取 `Dockerfile`（适用于 `echo` + `docker build` 组合）。

---

## **🚀 常用选项**

| 选项                          | 作用                                                        |
| ----------------------------- | ----------------------------------------------------------- |
| `-t, --tag NAME[:TAG]`      | **给镜像命名**（默认 `latest` 版本）                |
| `--file, -f FILE`           | **指定 `Dockerfile` 文件**（默认 `Dockerfile`）   |
| `--build-arg ARG=VALUE`     | **传递构建参数**（`ARG` 变量）                      |
| `--no-cache`                | **跳过缓存**，强制重新构建                            |
| `--pull`                    | **始终拉取最新基础镜像**                              |
| `--rm`                      | **构建成功后删除中间容器**（默认启用）                |
| `--target STAGE`            | **指定构建 `multi-stage` 的某个阶段**               |
| `--platform PLATFORM`       | **跨架构构建**（如 `linux/amd64`、`linux/arm64`） |
| `--progress TYPE`           | **设置构建进度格式**（`auto`、`plain`、`tty`）  |
| `--secret id=NAME,src=PATH` | **安全传递构建密钥**（如 API 密钥）                   |

---

## **🔹 示例**

### **1️⃣ 构建并命名镜像**

```sh
docker build -t myapp:1.0 .
```

**解释**：

- `-t myapp:1.0`：将镜像命名为 `myapp:1.0`。
- `.`：使用当前目录中的 `Dockerfile`。

---

### **2️⃣ 指定 `Dockerfile` 文件**

```sh
docker build -t myapp -f Dockerfile.dev .
```

**适用于**：项目中有多个 `Dockerfile` 时（如 `Dockerfile.dev`、`Dockerfile.prod`）。

---

### **3️⃣ 传递构建参数**

```sh
docker build --build-arg VERSION=2.0 -t myapp .
```

**适用于**：`Dockerfile` 中有 `ARG VERSION` 变量。

---

### **4️⃣ 禁用缓存（强制构建）**

```sh
docker build --no-cache -t myapp .
```

**适用于**：确保每次构建都使用最新的依赖，而不是缓存。

---

### **5️⃣ 多阶段构建（`multi-stage`）**

```sh
docker build --target builder -t myapp-builder .
```

**适用于**：只构建 `multi-stage` 构建的 `builder` 阶段。

---

### **6️⃣ 跨架构构建**

```sh
docker buildx build --platform linux/arm64 -t myapp .
```

**适用于**：构建适用于 `arm64`（如 `Apple M1/M2`）的 Docker 镜像。

---

## **🔚 总结**

`docker build` 是 Docker **镜像构建的核心命令**，可配合 `--tag` 命名、`--build-arg` 传递参数、`--no-cache` 重新构建、`--platform` 进行跨架构构建等。

**docker** system **df**

docker system prune -a
