FROM golang:1.9.1 as builder
WORKDIR /hello-world
COPY ./hello-world.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello-world .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /hello-world .
CMD ["./hello-world"]
