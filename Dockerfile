FROM alpine:edge AS builder
RUN apk update ; apk add gcc
RUN gcc cow.c -o cow

FROM scratch
COPY --from=0 cow .

ENTRYPOINT ["./cow", ""]
