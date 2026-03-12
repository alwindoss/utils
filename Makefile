APP_NAME := ducky
SRC_DIR := .
BIN_DIR := bin
GO_CMD := go
BUILD_CMD := $(GO_CMD) build
BUILD_FLAGS := -o
BUILD_ENVS := CGO_ENABLED=0

.PHONY: build clean

build: clean
	$(BUILD_ENVS) $(BUILD_CMD) $(BUILD_FLAGS) $(BIN_DIR)/$(APP_NAME)

clean:
	rm -rf $(BIN_DIR)
