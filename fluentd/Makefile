
ARCH ?= x86

image:
	@echo "Building for ARCH=$(ARCH)"
	@if [ ! -e Dockerfile.$(ARCH) ]; then \
		echo "ARCH=$(ARCH) is not supported."; \
		exit 1; \
	fi
	docker build -t fluentd-logger -f Dockerfile.$(ARCH) .


container: image
	./start.sh
