FROM golang:1.21.5

LABEL maintainer="lysoulwc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

ARG DEFAULT_GROUP_UID=1001
ARG DEFAULT_USER_UID=1001
ARG DEFAULT_GROUP_NAME=sora
ARG DEFAULT_USER_NAME=sora
RUN groupadd -g ${DEFAULT_GROUP_UID} ${DEFAULT_GROUP_NAME}
RUN useradd -s /bin/bash -m -u ${DEFAULT_USER_UID} -g ${DEFAULT_USER_NAME} ${DEFAULT_GROUP_NAME}

WORKDIR /home/${DEFAULT_USER_NAME}

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
#COPY go.mod go.sum ./
#RUN go mod download && go mod verify

#RUN go build -v -o /usr/local/bin/app ./

#CMD ["app"]

