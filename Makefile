# Go parameters
GOCMD=go
GINKGO=ginkgo
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_LOC=bin
BINARY_NAME=<<AppName>>
BINARY_UNIX=$(BINARY_NAME)_unix

all: build
package: build
	docker build -t alwindoss/$(BINARY_NAME):latest .
setup:
	$(GOGET) -v ./...
build: 
	$(GOBUILD) -o ./$(BINARY_LOC)/$(BINARY_NAME) -v ./cmd/$(BINARY_NAME)/...
	# GOOS=linux GOARCH=amd64 $(GOBUILD) -o ./$(BINARY_LOC)/$(BINARY_NAME) -v ./cmd/$(BINARY_NAME)/...
test: 
	$(GOTEST) -v ./...
clean: 
	$(GOCLEAN)
	rm -rf $(BINARY_LOC)
	rm -f *.db
run: clean build
	./$(BINARY_LOC)/$(BINARY_NAME)
