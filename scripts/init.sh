#!/bin/bash

golangci_content=$(golangci-lint --version)
golangci_res=$?
if [ $golangci_res -gt "0" ]
then
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.23.7	    
else
    echo "$golangci_content"
fi

golint_content=$(golint)
golint_res=$?

if [ $golint_res -gt "0" ]
then
    go get -u golang.org/x/lint/golint
else
    echo "$golint_content"
fi

safesql_content=$(safesql)
safesql_res=$?

if [ $safesql_res -gt "0" ]
then
    go get github.com/stripe/safesql
else
    echo "$safesql_content"
fi

shellcheck_content=$(safesql)
shellcheck_res=$?

# if [ $shellcheck_res -gt "0" ]
# then
#     apt-get -y install shellcheck
#     curl --output ~/shellcheck-stable.linux.x86_64.tar.xz https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz   
#     tar -xf ~/shellcheck-stable.linux.x86_64.tar.xz -C ~/
#     sudo cp ~/shellcheck-stable/shellcheck /usr/local/bin
# else
#     echo "$shellcheck_content"
# fi

git config core.hooksPath .githooks