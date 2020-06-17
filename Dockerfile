FROM golang:1.14-alpine as builder

WORKDIR $GOPATH/src/github.com/currycan/peer-finder

#ENV GOPROXY=https://goproxy.cn

RUN set -ex; apk add --no-cache upx ca-certificates tzdata
COPY ./go.mod ./
COPY ./go.sum ./
RUN set -ex; go mod download
COPY . .
RUN set -ex; \
  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o peer-finder; \
  upx --best peer-finder -o _upx_peer-finder; \
  mv -f _upx_peer-finder peer-finder

FROM alpine:3.12

LABEL maintainer="currycan <ansandy@foxmail.com>"

WORKDIR /etc/peer-finder

COPY --from=builder --chmod=0755 /go/src/github.com/currycan/peer-finder/peer-finder /usr/bin/peer-finder
COPY --from=builder --chmod=0755 /go/src/github.com/currycan/peer-finder/script/* /usr/local/bin/
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apk add -U --no-cache \
        busybox-extras curl; \
    rm -rf /var/cache/apk/*

CMD ["bootstrap.sh"]