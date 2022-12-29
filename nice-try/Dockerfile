FROM perl:5.16-slim-stretch

RUN cpanm Carton && \
    mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install gcc
RUN apt update && \
    apt install -y gcc && \
    rm -rf /var/lib/apt/lists/*

COPY cpanfile* /usr/src/app
RUN carton install

COPY . /usr/src/app

CMD [ "carton", "exec", "perl", "./run.pl" ]