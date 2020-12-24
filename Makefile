default: image

all: image

image:
	docker build \
	--pull \
	-f Dockerfile \
	--cache-from matthewfeickert/mermaid-cli:latest \
	--build-arg BASE_IMAGE=node:15.5.0 \
	-t matthewfeickert/mermaid-cli:latest \
	-t matthewfeickert/mermaid-cli:node-15.5.0 \
	--compress .
