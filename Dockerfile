FROM golang:1.14.15-alpine3.11 AS builder
RUN apk update ; apk add git upx binutils make
RUN git clone https://github.com/Code-Hex/Neo-cowsay
WORKDIR Neo-cowsay
RUN make
RUN strip bin/cowsay
RUN upx --best --lzma bin/cowsay

FROM scratch
COPY --from=0 /go/Neo-cowsay/bin/cowsay .

ENTRYPOINT ["./cowsay", ""]
