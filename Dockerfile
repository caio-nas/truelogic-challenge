FROM ruby:3.0.7

ENV APP_PATH=/app

RUN mkdir $APP_PATH
WORKDIR $APP_PATH
COPY . $APP_PATH

RUN git config --global --add safe.directory /app
RUN bundle install

RUN chmod +x bin/*
COPY bin/* /usr/bin/

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
