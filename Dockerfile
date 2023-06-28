FROM debian:11-slim

ARG PROTO_VERSION=23.3
ARG GRPCWEB_VERSION=1.4.2
ARG JS_VERSION=3.21.2

LABEL version=${GRPCWEB_VERSION}-js
LABEL maintainer="nrhrhysd616 <nrhrhysd616@becrazy.jp>"
LABEL description="protoc-gen-grpc-web"

# install protobuf and curl
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates protobuf-compiler curl unzip && rm -rf /var/lib/apt/lists/*

# download Google defined proto files
RUN curl -sSL https://github.com/protocolbuffers/protobuf/releases/download/v${PROTO_VERSION}/protoc-${PROTO_VERSION}-linux-x86_64.zip -o /tmp/protoc.zip && \
    unzip -qq /tmp/protoc.zip -d /tmp && \
    cp -r /tmp/include /usr/local && \
    rm -rf /tmp/*

# download protubuf-javascript files
RUN curl -sSL https://github.com/protocolbuffers/protobuf-javascript/releases/download/v${JS_VERSION}/protobuf-javascript-${JS_VERSION}-linux-x86_64.zip -o /tmp/protobuf-javascript.zip && \
    unzip -qq /tmp/protobuf-javascript.zip -d /tmp && \
    cp -r /tmp/bin/protoc-gen-js /usr/local/bin && \
    rm -rf /tmp/*

# install protoc-gen-grpc-web
RUN curl -sSL https://github.com/grpc/grpc-web/releases/download/${GRPCWEB_VERSION}/protoc-gen-grpc-web-${GRPCWEB_VERSION}-linux-x86_64 -o /usr/local/bin/protoc-gen-grpc-web && \
    chmod +x /usr/local/bin/protoc-gen-grpc-web

ADD scripts/entrypoint.sh /

VOLUME [ "/protos", "/out" ]

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "--grpc-web_out=import_style=commonjs,mode=grpcwebtext" ]