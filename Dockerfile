# Etapa de construcción
FROM golang:1.24 as builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app .

# Etapa final
FROM gcr.io/distroless/static

WORKDIR /root/

COPY --from=builder /app/app .

CMD ["./app"]
