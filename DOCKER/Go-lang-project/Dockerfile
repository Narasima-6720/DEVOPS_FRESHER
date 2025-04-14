
# GO-LANG APP REDUCE IMAGE USING DISTROLESS IMAGE

#BUild Stage

FROM amazonlinux AS builder
LABEL maintainer="Narasimha reddy <narasimhagrp@gmail.com"
RUN yum update && yum install go -y
ENV GO111MODULE=off
WORKDIR /opt/Go-lang-project
COPY calculator.go .
RUN go build calculator.go 

#Main Stage

FROM scratch
COPY  --from=builder /opt/Go-lang-project/calculator /opt/Go-lang-project/calculator
ENTRYPOINT ["/opt/Go-lang-project/calculator"]


