#!/bin/bash

which yarn >/dev/null
if [[ $? -eq 0 ]]
then
    echo "Yarn instalado: $(yarn --version)"

else
    ## Configure the repository
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

    ## Install yarn
    apt-get update && apt-get install -yq yarn
fi


