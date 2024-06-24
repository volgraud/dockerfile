FROM golang:1.21.0

WORKDIR /final-app

COPY go.mod go.sum tracker.db ./

RUN go mod download 

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /final

CMD ["/final"]