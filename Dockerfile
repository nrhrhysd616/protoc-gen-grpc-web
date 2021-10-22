FROM alpine:edge

ARG PROTO_VERSION=3.18.1
ARG GRPCWEB_VERSION=1.3.0

LABEL version=${GRPCWEB_VERSION}
LABEL maintainer="nrhrhysd616 <nrhrhysd616@becrazy.jp>"
LABEL description="protoc-gen-grpc-web"

# install protobuf and curl
RUN apk update && apk add --no-cache protobuf curl

# download Google defined proto files
RUN curl -sSL https://github.com/protocolbuffers/protobuf/releases/download/v${PROTO_VERSION}/protoc-${PROTO_VERSION}-linux-x86_64.zip -o /tmp/protoc.zip && \
    unzip -qq /tmp/protoc.zip -d /tmp && \
    cp -r /tmp/include /usr/local && \
    rm -rf /tmp/*

# install protoc-gen-grpc-web
RUN curl -sSL https://github.com/grpc/grpc-web/releases/download/${GRPCWEB_VERSION}/protoc-gen-grpc-web-${GRPCWEB_VERSION}-linux-x86_64 -o /usr/local/bin/protoc-gen-grpc-web && \
    chmod +x /usr/local/bin/protoc-gen-grpc-web

ADD scripts/entrypoint.sh /

VOLUME [ "/protos", "/out" ]

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "--grpc-web_out=import_style=commonjs,mode=grpcwebtext" ]