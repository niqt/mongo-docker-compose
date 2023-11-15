FROM golang:1.21.3-alpine as builder
WORKDIR /root/
RUN apk add --update --no-cache make

RUN mkdir -p /root/mongo-docker-compose
WORKDIR /root/mongo-docker-compose
COPY . .
RUN make build

FROM alpine:3.18
WORKDIR /root/

COPY --from=builder /root/mongo-docker-compose/bin/ .

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.8.0/wait wait
RUN chmod +x wait

ENV TESTDB_MONGO=mongodb

EXPOSE 8080
CMD ./wait && ./mongo-docker-compose
