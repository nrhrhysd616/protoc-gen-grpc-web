VERSION = 1.3.1

ifdef version
	VERSION=${version}
endif

build-push:
	docker buildx use multiplatform-builder && docker buildx build --platform linux/amd64,linux/arm64 -t nrhrhysd616/protoc-gen-grpc-web:${VERSION} -t nrhrhysd616/protoc-gen-grpc-web:latest --push . && docker buildx use default
