VERSION = 1.3.0

ifdef version
	VERSION=${version}
endif

build:
	docker build -t nrhrhysd616/protoc-gen-grpc-web:${VERSION} -t nrhrhysd616/protoc-gen-grpc-web:latest .