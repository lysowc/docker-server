FROM python:3.9.18

ARG DEFAULT_GROUP_UID=1001
ARG DEFAULT_USER_UID=1001
ARG DEFAULT_GROUP_NAME=sora
ARG DEFAULT_USER_NAME=sora
RUN groupadd -g ${DEFAULT_GROUP_UID} ${DEFAULT_GROUP_NAME}
RUN useradd -s /bin/bash -m -u ${DEFAULT_USER_UID} -g ${DEFAULT_USER_NAME} ${DEFAULT_GROUP_NAME}

#切换源
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip config set install.trusted-host mirrors.aliyun.com

RUN python -m pip install --upgrade pip

WORKDIR /home/${DEFAULT_USER_NAME}
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt

#COPY . .

#CMD [ "python", "./your-daemon-or-script.py" ]

