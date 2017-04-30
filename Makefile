
ARCH ?= $(shell uname -m)

all: image

fluentd:
	make -c fluentd image ARCH=$(ARCH)


image:
	@echo "Building for ARCH=$(ARCH)"
	@if [ ! -e Dockerfile.$(ARCH) ]; then \
		echo "ARCH=$(ARCH) is not supported."; \
		exit 1; \
	fi
	docker build -t speedtest -f Dockerfile.$(ARCH) .
