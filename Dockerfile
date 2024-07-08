FROM golang:1.22.5-alpine AS build

WORKDIR /app

COPY go.mod .
COPY index.go .

RUN go build index.go

FROM scratch

COPY --from=build /app /

ENTRYPOINT ["./index"]