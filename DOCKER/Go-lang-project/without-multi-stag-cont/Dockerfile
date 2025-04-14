# GO LANG CALCULATOR APP
FROM amazonlinux
LABEL maintainer="Narasimha reddy <narasimhagrp@gmail.com>"
RUN yum update && yum install golang-go -y
ENV GO111MODULE=off
WORKDIR /opt/Go-lang-project
COPY . .
RUN go build calculator.go
CMD ["/opt/Go-lang-project/calculator"]


