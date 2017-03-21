FROM node:alpine
MAINTAINER Ken Chen<blair1226@gmail.com>

RUN apk --update --no-cache add python openssl openssh bash ca-certificates libc6-compat

# google cloud sdk 
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc --additional-components kubectl alpha beta

# Finalize
RUN mkdir /.ssh && mkdir /db_utils
COPY . /db_utils
COPY backup_3d /etc/periodic/daily
ENV PATH $PATH:/google-cloud-sdk/bin  

CMD crond -f
