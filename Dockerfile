## Build the manager binary
#FROM golang:1.20 as builder
#
#WORKDIR /workspace
#
## Copy the Go Modules manifests
#COPY go.mod go.mod
#COPY go.sum go.sum
#RUN go mod download
#
## Copy the go source codes
#COPY cmd/ cmd/
#COPY pkg/ pkg/
#
## Build
#RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -o controller cmd/epsprobe/epsprobe.go

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM alpine:3.15.0

ARG BINARY

RUN apk add --no-cache ca-certificates

#WORKDIR /
#COPY --from=builder /workspace/controller .
#COPY controller /controller

COPY ${BINARY} /bin/${BINARY}