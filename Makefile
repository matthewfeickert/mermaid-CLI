default: image

all: image

image:
	docker build -f Dockerfile \
	--cache-from matthewfeickert/mermaid-cli:latest \
	--build-arg BASE_IMAGE=node:10.16.3 \
	-t matthewfeickert/mermaid-cli:latest \
	-t matthewfeickert/mermaid-cli:node-10.16.3 \
	--compress .
