#!/bin/bash
mkdir -p /root/redis/data
mkdir -p /root/redis/users

echo 'user default on sanitize-payload #45257456a8e20c4ca7d53cff78425fcf12ef41c86e83210d16abcdcdba4bddf3 ~* &* +@all' > /root/redis/users/users.acl
echo 'user ebanina on sanitize-payload #864a19483269191d74eaf252965a465a4558636db1fd29c81eac2e76c9879097 resetchannels +@all' >> /root/redis/users/users.acl

chown -R 1001:1001 /root/redis

echo '
version: "3.1"
services:
  redis-node:
    image: docker.io/bitnami/redis-cluster:7.2
    container_name: redis
    restart: always
    extra_hosts:
      redis-node-1: 10.72.32.236
      redis-node-2: 10.72.32.7
      redis-node-3: 10.72.32.226
      redis-node-4: 10.72.32.163
      redis-node-5: 10.72.32.93
      redis-node-6: 10.72.32.62
    network_mode: host
    volumes:
      - /root/redis/data:/bitnami/redis/data
      - /root/redis/users:/bitnami/redis/users
    environment:
      REDIS_IO_THREADS: '100'
      REDIS_ACLFILE: '/bitnami/redis/users/users.acl'
      REDIS_PASSWORD: 'NhsHhDLSr2PNjMba2QK8'
      REDIS_NODES: 'redis-node-1 redis-node-2 redis-node-3 redis-node-4 redis-node-5 redis-node-6'
' > /root/docker-compose.yml &&

docker-compose -f /root/docker-compose.yml up