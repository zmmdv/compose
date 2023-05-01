kafka cluster made with docker-compose on 3 different virtual hosts

before start you have to create folders with ownership for appuser ( user which container uses )
for example: useradd -u 1000 -m -s /bin/bash appuser && mkdir -p /root/cluster/kafka-1 && chown -R appuser:appuser /root/cluster/kafka-1

Confluent Kafka configuration

For the Kafka (cp-kafka) image, convert the kafka.properties file variables as below and use them as environment variables:

    Prefix with KAFKA_.
    Convert to upper-case.
    Replace a period (.) with a single underscore (_).
    Replace a dash (-) with double underscores (__).
    Replace an underscore (_) with triple underscores (___).
