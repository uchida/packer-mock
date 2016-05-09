# packer-mock

![Version](https://img.shields.io/github/tag/uchida/packer-mock.svg?maxAge=2592000)
[![License](https://img.shields.io/github/license/uchida/packer-mock.svg?maxAge=2592000)](https://tldrlegal.com/license/creative-commons-cc0-1.0-universal)
[![CircleCI](https://img.shields.io/circleci/project/uchida/packer-mock.svg?maxAge=2592000)](https://circleci.com/gh/uchida/packer-mock)

packer template for building mock, clean room package builder for RedHat Enterprise Linux derivative distributions,

vagrant images are available at [uchida/mock](https://atlas.hashicorp.com/uchida/boxes/mock)

```
vagrant init uchida/mock; vagrant up
```

## Building Images

To build images, simply run:

```
$ git clone https://github.com/uchida/packer-mock
$ cd packer-mock
$ packer build template.json
```

If you want to build only virtualbox, vmware or qemu.

```
$ packer build -only=virtualbox-iso template.json
$ packer build -only=vmware-iso template.json
$ packer build -only=qemu template.json
```

## Release setup

```console
$ cp template.json template.json.orig
$ jq ".variables.version = \"$(git describe --abbrev=0 --tags)\"" template.json.orig > template.json
$ "diff -uB template.json{.orig,} || :"
$ packer build template.json
```

## License

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")]
(http://creativecommons.org/publicdomain/zero/1.0/deed)

dedicated to public domain

