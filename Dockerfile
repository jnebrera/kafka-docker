FROM wurstmeister/kafka:2.12-2.1.0

MAINTAINER devel@wizzie.io

ADD kafka-kubernetes-start.sh /usr/bin/kafka-kubernetes-start.sh
ADD kafkaOk.sh /usr/bin/kafkaOk.sh

# CMD ["kafka-kubernetes-start.sh"]
