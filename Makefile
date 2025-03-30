IMAGE_NAME := openhands-custom-sandbox
CONTAINER_NAME := openhands-sandbox
DOCKER_REGISTRY := ghcr.io
DOCKER_USER := upamune

# Default target
.PHONY: all
all: build

# Build the Docker image
.PHONY: build
build:
	@echo "Building Docker image: $(IMAGE_NAME)"
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
.PHONY: run
run:
	@echo "Running Docker container: $(CONTAINER_NAME)"
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Clean up Docker resources
.PHONY: clean
clean:
	@echo "Cleaning up Docker resources"
	-docker rm -f $(CONTAINER_NAME) 2>/dev/null || true
	-docker rmi $(IMAGE_NAME) 2>/dev/null || true

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build  - Build the Docker image"
	@echo "  run    - Run the Docker container"
	@echo "  clean  - Clean up Docker resources"
	@echo "  help   - Show this help message"
