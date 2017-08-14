[deprecated, latest go support mipsle already.] 

# Official arch supported by latest go version
https://golang.org/doc/install/source#environment
```
$GOOS	$GOARCH
android	arm
darwin	386
darwin	amd64
darwin	arm
darwin	arm64
dragonfly	amd64
freebsd	386
freebsd	amd64
freebsd	arm
linux	386
linux	amd64
linux	arm
linux	arm64
linux	ppc64
linux	ppc64le
linux	mips
linux	mipsle
linux	mips64
linux	mips64le
netbsd	386
netbsd	amd64
netbsd	arm
openbsd	386
openbsd	amd64
openbsd	arm
plan9	386
plan9	amd64
solaris	amd64
windows	386
windows	amd64
```

# About this image
Golang1.4.2 based gc compiler ported to MIPS32LE

Dockerfile: https://github.com/fzinfz/docker-images/blob/master/go-mips32le/Dockerfile

Modified from the big endian version:  [conoro/go-mips32](https://hub.docker.com/r/conoro/go-mips32/) ( [Guide](http://conoroneill.net/three-ways-to-build-go-14-binaries-for-mips32-onion-omega-golang/))

go source: https://github.com/gomini/go-mips32

# Quick start
```
docker run -it fzinfz/go-mips32le /bin/bash
```

# Sample binary
```
# file helloworld 
helloworld: ELF 32-bit LSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), statically linked, not stripped
```
# go env
```
GOARCH="mips32le"
GOBIN=""
GOCHAR="v"
GOEXE=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOOS="linux"
GOPATH="/go"
GORACE=""
GOROOT="/usr/local/go"
GOTOOLDIR="/usr/local/go/pkg/tool/linux_amd64"
CC="gcc"
GOGCCFLAGS="-fPIC -fmessage-length=0"
CXX="g++"
CGO_ENABLED="0"
```


