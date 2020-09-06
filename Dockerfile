FROM golang:alpine as builder
COPY main.go .
RUN go build -o /app main.go

FROM alpine:3.7
ENV GOTRACEBACK=single
CMD ["./app"]
COPY --from=builder /app .
