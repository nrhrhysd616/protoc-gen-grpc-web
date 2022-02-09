# nrhrhysd616/protoc-gen-grpc-web

## Description

nrhrhysd616/protoc-gen-grpc-web is a docker image for grpc-web generator plugin for the Google Protocol Buffers compiler (protoc).  
You can compile for grpc-web without installing protoc and grpc-web on the host.  
This Docker image uses **[grpc-web](https://github.com/grpc/grpc-web)**.

## Usage

This docker image has two volumes: /out and /protos which are the directory to write the javascript or typescript compiled files to and the directory containing your proto files.

You could generate JavaScript compiled files for the examples by running the following:

```sh
$docker run --rm \
  -v $(pwd)/examples/out:/out \
  -v $(pwd)/examples/protos:/protos \
  nrhrhysd616/protoc-gen-grpc-web
```

By default JavaScript files are generated in /out.
This can be changed by passing the `--grpc-web_out` parameter to the container.  
See [GitHub on grpc-web](https://github.com/grpc/grpc-web#client-configuration-options) for more information.

For example, to generate TypeScript files for the examples(Experimental):

```sh
$docker run --rm \
  -v $(pwd)/examples/out:/out \
  -v $(pwd)/examples/protos:/protos \
  nrhrhysd616/protoc-gen-grpc-web \
  --grpc-web_out=import_style=typescript,mode=grpcwebtext
```

## Repository

* This Docker image: [https://github.com/nrhrhysd616/protoc-gen-grpc-web](https://github.com/nrhrhysd616/protoc-gen-grpc-web)

* grpc-web: [https://github.com/grpc/grpc-web](https://github.com/grpc/grpc-web)