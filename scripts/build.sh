#!/bin/bash
go get -v -t -d ./...
GOOS=linux GOARCH=amd64 go build -v -o ./bin/sample-api.go ./