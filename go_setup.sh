#!/bin/bash
set -e
echo "go install golang.org/x/tools/cmd/goimports@latest"
go install golang.org/x/tools/cmd/goimports@latest
echo "go install github.com/rogpeppe/godef@latest"
go install github.com/rogpeppe/godef@latest
echo "go install github.com/nsf/gocode"
go install github.com/nsf/gocode@latest
echo "go install golang.org/x/tools/cmd/guru"
go install golang.org/x/tools/cmd/guru@latest
echo "go install github.com/dougm/goflymake"
go install github.com/dougm/goflymake@latest
echo "All done, enjoy!"
