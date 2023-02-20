FROM golang:1.20 as build

WORKDIR /go/src/app
COPY . .

RUN CGO_ENABLED=0 go build -o /go/bin/app

FROM gcr.io/distroless/static-debian11

COPY --from=build /go/bin/app /

EXPOSE 8080

ENTRYPOINT [ "/app" ]