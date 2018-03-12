#!/bin/bash
echo "go get -u golang.org/x/tools/cmd/..."
go get -u golang.org/x/tools/cmd/...
echo "go get -u github.com/rogpeppe/godef/..."
go get -u github.com/rogpeppe/godef/...
echo "go get -u github.com/nsf/gocode"
go get -u github.com/nsf/gocode
echo "go get -u golang.org/x/tools/cmd/goimports"
go get -u golang.org/x/tools/cmd/goimports
echo "go get -u golang.org/x/tools/cmd/guru"
go get -u golang.org/x/tools/cmd/guru
echo "go get -u github.com/dougm/goflymake"
go get -u github.com/dougm/goflymake
echo "All done, enjoy!"
