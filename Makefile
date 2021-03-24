NAME:=docker-machine-driver-outscale

# local build, use user and timestamp it
BINARY_NAME ?= ${NAME}
VERSION:=$(shell  date +%Y%m%d%H%M%S)

BIN_DIR:=bin
GO ?= go

.PHONY: all
all: build

#
# Go build related tasks
#
.PHONY: go-install
go-install:
	GO111MODULE=on $(GO) install .

.PHONY: go-run
go-run: go-install
	GO111MODULE=on $(GO) run .

.PHONY: go-fmt
go-fmt:
	gofmt -s -e -d $(shell find . -name "*.go" | grep -v /vendor/)

.PHONY: go-vet
go-vet:
	echo $(GO) vet $(shell $(GO) list ./... | grep -v /vendor/)


#
# Docker-related tasks
#
.PHONY: binary-build
binary-build:
	mkdir -p ${BIN_DIR}
	GO111MODULE=on GOOS=linux GOARCH=amd64 go build -o ${BIN_DIR}/${BINARY_NAME}-linux .
	GO111MODULE=on GOOS=darwin GOARCH=amd64 go build -o ${BIN_DIR}/${BINARY_NAME}-darwin .
#
# Tests-related tasks
#
.PHONY: unit-test
unit-test: go-install
	go test -v ./driver/outscale/amazonec2_test.go
	go test -v ./driver/outscale/awscredentials_test.go
	go test -v ./driver/outscale/stub_test.go



