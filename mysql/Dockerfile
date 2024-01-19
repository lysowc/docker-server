FROM mysql:8.0.35

LABEL maintainer="lysoulwc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

ARG DEFAULT_GROUP_UID=1001
ARG DEFAULT_USER_UID=1001
ARG DEFAULT_GROUP_NAME=sora
ARG DEFAULT_USER_NAME=sora
RUN if [ ${DEFAULT_USER_NAME} != root ]; then \
    groupadd -g ${DEFAULT_GROUP_UID} ${DEFAULT_GROUP_NAME} && \
    useradd -s /bin/bash -m -u ${DEFAULT_USER_UID} -g ${DEFAULT_USER_NAME} ${DEFAULT_GROUP_NAME}\
;fi
