FROM alpine:edge AS builder
RUN apk update ; apk add wget
RUN wget https://github.com/Code-Hex/Neo-cowsay/releases/download/v1.0.1/cowsay_v1.0.1_Linux_x86_64.tar.gz
RUN tar -xf cowsay_v1.0.1_Linux_x86_64.tar.gz

FROM scratch
COPY --from=0 cowsay .

ENTRYPOINT ["./cowsay", ""]
