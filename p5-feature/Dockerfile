FROM perl:5.36.0-slim

RUN cpanm Carton && \
    mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY cpanfile* /usr/src/app
RUN carton install

COPY . /usr/src/app

CMD [ "carton", "exec", "perl", "./run.pl" ]