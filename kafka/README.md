kafka cluster made with docker-compose on 3 different virtual hosts


Confluent Kafka configuration

For the Kafka (cp-kafka) image, convert the kafka.properties file variables as below and use them as environment variables:

    Prefix with KAFKA_.
    Convert to upper-case.
    Replace a period (.) with a single underscore (_).
    Replace a dash (-) with double underscores (__).
    Replace an underscore (_) with triple underscores (___).
