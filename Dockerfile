# Etapa de construcción
FROM golang:1.24 as builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN go build -o app .

# Etapa final
FROM gcr.io/distroless/base-debian10

WORKDIR /root/

COPY --from=builder /app/app .

CMD ["./app"]
