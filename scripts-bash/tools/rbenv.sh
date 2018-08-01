#!/bin/bash

## Install rbenv
export RBENV_ROOT="/root/.rbenv"

if [[ ! -e ${RBENV_ROOT} ]]
then
    mkdir -p ${RBENV_ROOT}	
    git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT}
    export PATH=${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:$PATH
    cd ${RBENV_ROOT} && src/configure && make -C src

    ## Install ruby-build
    git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build
    cd ${RBENV_ROOT}/plugins/ruby-build && PREFIX=${RBENV_ROOT}/plugins ./install.sh

    # Rbenv PATH (Usuário sistemas)
    echo "# Rbenv PATH" >> ~/.bashrc
    echo "export RBENV_ROOT="$RBENV_ROOT"" >> ~/.bashrc
    echo 'export PATH=$RBENV_ROOT/bin:$RBENV_ROOT/libexec:$RBENV_ROOT/shims:$RBENV_ROOT/plugins/ruby-build/bin:$PATH' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc

fi    
