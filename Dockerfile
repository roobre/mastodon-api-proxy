FROM golang:1.22-alpine3.19 as builder

WORKDIR /proxy
COPY . .
RUN go build -o /bin/proxy .

FROM alpine:3.19.1
COPY --from=builder /bin/proxy /usr/local/bin/
ENTRYPOINT [ "/usr/local/bin/proxy" ]
