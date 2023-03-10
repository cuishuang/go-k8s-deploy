FROM golang:latest AS build
#上面这行也可以换成具体的某个版本，如golang:1.19.5
WORKDIR /go/src/test
COPY . /go/src/test
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN CGO_ENABLED=0 go build -v -o main .

FROM alpine AS api
RUN mkdir /app
COPY --from=build /go/src/test/main /app
WORKDIR /app
ENTRYPOINT ["./main", "-v" ,"2.0"]