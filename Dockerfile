FROM golang:alpine as builder

WORKDIR /build

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -o openapi-model-replace main.go

FROM gruebel/upx:latest as upx
COPY --from=builder /build/openapi-model-replace openapi-model-replace.org
RUN upx --best --lzma /openapi-model-replace.org -o /openapi-model-replace


FROM alpine:latest as prod

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=upx /openapi-model-replace /root/openapi-model-replace

EXPOSE 17888
CMD ["/bin/bash"]