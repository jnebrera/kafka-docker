FROM maven:3.5-jdk-8 as maven

RUN git clone https://github.com/wizzie-io/kafka-metrics-reporter.git
RUN cd kafka-metrics-reporter && git pull --tags && git checkout kafka-metric-reporter-1.0.0 && mvn package -DskipTests

FROM wurstmeister/kafka:2.12-2.1.0

MAINTAINER devel@wizzie.io

ADD kafka-kubernetes-start.sh /usr/bin/kafka-kubernetes-start.sh
ADD kafkaOk.sh /usr/bin/kafkaOk.sh

COPY --from=maven /kafka-metrics-reporter/target/*-selfcontained.jar /opt/kafka/libs/

# CMD ["kafka-kubernetes-start.sh"]
