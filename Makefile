#! /usr/bin/make -f
# -*- makefile -*-
# ex: set tabstop=4 noexpandtab:
# Copyright: 2019-present Samsung Electronics Co., Ltd. and other contributors
# SPDX-License-Identifier: MPL-2.0

default: all
	@echo "# log: $@: $^"

package_name?=lorabeeterminal
package_url?=https://github.com/brocaar/lorabeeterminal/
package_id?=github.com/brocaar/${package_name}

main_src=main.go
main_srcs?=$(wildcard *.go | sort)

sudo?=sudo
go?=go

run_args?=
#export GOPATH?=${CURDIR}
#export GOROOT?=${CURDIR}

all: get version build
	@echo "# log: $@: $^"

run: ${main_src} go.mod
	${go} run $< ${run_args}

get: go.mod
	${go} $@ .

go.mod:
	go mod init ${package_id}

go.sum: go.mod
	${go} get
