ARG ELK_VERSION

FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}

RUN filebeat modules enable nginx
