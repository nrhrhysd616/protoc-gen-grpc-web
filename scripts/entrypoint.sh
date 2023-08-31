#!/bin/sh

PROTOS_DIR=/protos
OUTPUT_DIR=/out

args_with_output_dir=""

for arg in "$@"; do
    echo "arg: ${arg}"
    args_with_output_dir="${arg}:${OUTPUT_DIR} ${args_with_output_dir}"
done

exec protoc \
    --proto_path=/usr/local/include:${PROTOS_DIR} \
    ${args_with_output_dir} \
    ${PROTOS_DIR}/**/*.proto