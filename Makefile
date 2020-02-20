VERSION = $(shell git tag --sort=version:refname  | tail -1)

build:
	go build -v -i -o terraform-provider-unicreds

test:
	go test ./...

install: build
	mkdir -p ~/.terraform.d/plugins
	cp terraform-provider-unicreds ~/.terraform.d/plugins/terraform-provider-unicreds_$(VERSION)

release:
	GOOS=darwin go build -v -o terraform-provider-unicreds_darwin_amd64
	GOOS=linux go build -v -o terraform-provider-unicreds_linux_amd64
