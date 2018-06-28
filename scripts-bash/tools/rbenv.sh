#!/bin/bash

## Install rbenv
export RBENV_ROOT="/usr/local/rbenv"
mkdir -p ${RBENV_ROOT}
chown ${USUARIO}. ${RBENV_ROOT} -R

if [[ ! -e ${RBENV_ROOT} ]]
then	
    su ${USUARIO} -c "git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT}"
    su ${USUARIO} -c "export PATH=${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:${PATH}"
    su ${USUARIO} -c "cd ${RBENV_ROOT} && src/configure && make -C src"

    ## Install ruby-build
    su ${USUARIO} -c "git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build"
    su ${USUARIO} -c "cd ${RBENV_ROOT}/plugins/ruby-build && PREFIX=/usr/local/rbenv/plugins ./install.sh"

    # Rbenv PATH (Usuário sistemas)
    echo "" >> /home/${USUARIO}/.bashrc
    echo "# Rbenv PATH" >> /home/${USUARIO}/.bashrc
    echo "export RBENV_ROOT="/usr/local/rbenv"" >> /home/${USUARIO}/.bashrc
    echo "export PATH="${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:${RBENV_ROOT}/plugins/ruby-build/bin:$PATH"" >> /home/${USUARIO}/.bashrc
    echo 'eval "$(rbenv init -)"' >> /home/${USUARIO}/.bashrc

    # Rbenv PATH Global
    echo "" > /etc/profile.d/rbenv.sh
    echo "# Rbenv PATH" >> /etc/profile.d/rbenv.sh
    echo "export RBENV_ROOT="/usr/local/rbenv"" >> /etc/profile.d/rbenv.sh
    echo "export PATH="${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:${RBENV_ROOT}/plugins/ruby-build/bin:$PATH"" >> /etc/profile.d/rbenv.sh
    echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
    chmod +x /etc/profile.d/rbenv.sh
    source /etc/profile.d/rbenv.sh    

fi    
