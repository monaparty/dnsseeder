FROM golang:1.14.2-alpine3.11 as builder

ADD . src/
WORKDIR src
RUN go get github.com/gombadi/dnsseeder

FROM alpine:3.11
COPY --from=builder /go/bin/dnsseeder /
COPY configs /configs
EXPOSE 8053 8080

ENTRYPOINT [ "/dnsseeder" ]
