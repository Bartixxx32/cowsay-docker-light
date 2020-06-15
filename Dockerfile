FROM golang:alpine AS builder
RUN apk update ; apk add git make go
RUN git clone https://github.com/Code-Hex/Neo-cowsay
WORKDIR Neo-cowsay
RUN make

FROM scratch
COPY --from=0 /Neo-cowsay/bin/cowsay .

ENTRYPOINT ["./cowsay", ""]
