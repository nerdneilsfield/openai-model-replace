FROM golang:alpine as builder

WORKDIR /build

COPY main.go go.mod go.sum ./

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o openai-model-replace main.go

FROM gruebel/upx:latest as upx
COPY --from=builder /build/openai-model-replace openai-model-replace.org
RUN upx --best --lzma /openai-model-replace.org -o /openai-model-replace


FROM alpine:latest as prod

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=upx /openai-model-replace /root/openai-model-replace
COPY README.md model_list.json /root/

EXPOSE 17888
CMD ["/root/openai-model-replace", "-model_table", "/root/model_list.json"]