#!/bin/sh

PROTOS_DIR=/protos
OUTPUT_DIR=/out

args=$1

exec protoc \
    --proto_path=/usr/local/include:${PROTOS_DIR} \
    ${args}:${OUTPUT_DIR} \
    ${PROTOS_DIR}/*.proto