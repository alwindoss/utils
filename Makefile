APP_NAME := manna
SRC_DIR := ./cmd/manna/... # If the Source files are in the root of the project then use .
BIN_DIR := bin
GO_CMD := go
BUILD_CMD := $(GO_CMD) build
BUILD_FLAGS := -o
BUILD_ENVS := CGO_ENABLED=0

.PHONY: build run clean

build: clean
	@echo "\nBuilding $(APP_NAME)"
	$(BUILD_ENVS) $(BUILD_CMD) $(BUILD_FLAGS) $(BIN_DIR)/$(APP_NAME) $(SRC_DIR)

run: build
	@echo "\nRunning ./$(BIN_DIR)/$(APP_NAME)"
	./$(BIN_DIR)/$(APP_NAME)

clean:
	@echo "\nDeleting $(BIN_DIR)"
	rm -rf $(BIN_DIR)
