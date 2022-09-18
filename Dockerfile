FROM golang:latest as builder

WORKDIR /app

COPY . .

RUN go build -o /main index.go


FROM scratch

WORKDIR /

COPY --from=builder /main /main

ENTRYPOINT ["/main"]