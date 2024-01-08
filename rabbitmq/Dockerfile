FROM rabbitmq:3.12.12

LABEL maintainer="lysoulwc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

ARG DEFAULT_GROUP_UID=1001
ARG DEFAULT_USER_UID=1001
ARG DEFAULT_GROUP_NAME=sora
ARG DEFAULT_USER_NAME=sora
RUN groupadd -g ${DEFAULT_GROUP_UID} ${DEFAULT_GROUP_NAME}
RUN useradd -s /bin/bash -m -u ${DEFAULT_USER_UID} -g ${DEFAULT_USER_NAME} ${DEFAULT_GROUP_NAME}

WORKDIR /home/${DEFAULT_USER_NAME}

RUN rabbitmq-plugins enable --offline rabbitmq_management
