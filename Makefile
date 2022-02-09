VERSION = 1.3.1
BUILDX_NAME = buildx_buildkit_multiplatform-builder0

ifdef version
	VERSION=${version}
endif

build-push:
	docker buildx use multiplatform-builder && docker buildx build --platform linux/amd64,linux/arm64 -t nrhrhysd616/protoc-gen-grpc-web:${VERSION} -t nrhrhysd616/protoc-gen-grpc-web:latest --push . && docker buildx use default && docker stop ${BUILDX_NAME} && docker rm ${BUILDX_NAME}
