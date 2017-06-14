FROM alpine:3.6
MAINTAINER Sascha Peilicke <sascha.peilicke@here.com>

ARG TRANSPILER_VERSION=+

ENV TRANSPILER_HOME=/opt/transpiler
ENV TRANSPILER_VERSION=$TRANSPILER_VERSION

RUN apk add --no-cache bash openjdk8-jre
COPY scripts/docker/build.gradle gradlew $TRANSPILER_HOME/
COPY gradle/wrapper/gradle-wrapper.properties gradle/wrapper/gradle-wrapper.jar $TRANSPILER_HOME/gradle/wrapper/
WORKDIR $TRANSPILER_HOME
RUN ./gradlew -Pversion=$TRANSPILER_VERSION :build

ENTRYPOINT ./gradlew -Pversion=$TRANSPILER_VERSION run
# Set additional defaults that likely to be changed:
CMD [ "-Dexec.args=\"-input fidl -output ../generated" ]
