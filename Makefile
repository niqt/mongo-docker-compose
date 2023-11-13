
# Go Checkup
GOPATH ?= $(shell go env GOPATH)
GO111MODULE:=auto
export GO111MODULE
ifeq "$(GOPATH)" ""
  $(error Please set the environment variable GOPATH before running `make`)
endif
PATH := ${GOPATH}/bin:$(PATH)

GO = go

# Commands
.PHONY: all
all: | deps

.PHONY: deps
deps:
	$(GO) mod tidy

.PHONY: build
build: ; $(info $(M) Building executable...) @ ## Build program binary
	mkdir -p bin
	$(GO) build  ${GCFLAGS} -o bin/mongo-docker-compose


.PHONY: run
run:
	$(GO) run -race .


