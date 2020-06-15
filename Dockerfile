FROM golang:alpine AS builder
RUN apk update ; apk add git make
RUN git clone https://github.com/Code-Hex/Neo-cowsay
WORKDIR Neo-cowsay
RUN make

FROM scratch
COPY --from=0 /go/Neo-cowsay/bin/cowsay .

ENTRYPOINT ["./cowsay", ""]
