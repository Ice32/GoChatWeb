FROM google/dart

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
ADD . /app

RUN apt-get update
RUN apt-get -y install apt-transport-https
RUN sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
RUN sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
RUN apt-get update
RUN apt-get -y install dart
RUN pub global activate webdev

RUN pub get --offline

EXPOSE 8080
CMD [ "/root/.pub-cache/bin/webdev", "serve" , "--release", "--hostname", "0.0.0.0"]
