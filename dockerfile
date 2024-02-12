FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go


## This image is most useful in the context of building base images (such as debian and busybox) 
## or super minimal images (that contain only a single binary and whatever it requires)
FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8080

ENTRYPOINT ["/main"]

