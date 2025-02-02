# base docker image
FROM anibali/pytorch:1.8.1-cuda11.1-ubuntu20.04

# Set up time zone.
ENV TZ=UTC
RUN sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

# Install system libraries required by OpenCV.
RUN sudo apt-get update \
 && sudo apt-get install -y libgl1-mesa-glx libgtk2.0-0 libsm6 libxext6 \
 && sudo rm -rf /var/lib/apt/lists/*

# 安装python程序运行程序的所有依赖
RUN python -m pip install --upgrade --no-cache-dir --ignore-installed -i https://mirrors.aliyun.com/pypi/simple \
    flask==0.12.2 \

RUN python -m pip install --upgrade --no-cache-dir --ignore-installed --no-deps -i https://mirrors.aliyun.com/pypi/simple timm==0.3.2 

USER root
ENV WORKPATH="/workspace"
ENV DEVICE="cuda:0"
ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' > /etc/timezone

# 创建工作目录    
RUN sudo mkdir -p ${WORKPATH}

# 将当前路径的文件复制到容器内对应的目录下
COPY ./ ${WORKPATH}

# 切换到工作目录
WORKDIR ${WORKPATH}

# 进入服务代码所在的路径    
WORKDIR ${WORKPATH}/service
# 通过gunicorn启动服务
CMD gunicorn -c gunicorn.conf.py --log-config log.conf app:app


