#!/bin/bash

CHAVE_SSH="/root/.ssh"

if [[ -d ${CHAVE_SSH} ]]; 
then
    echo "Chave ${CHAVE_SSH} já existe!!!"
else
    mkdir -p ${CHAVE_SSH}
    chmod 700 ${CHAVE_SSH}
    ssh-keygen -b 2048 -t rsa -f ${CHAVE_SSH}/id_rsa -q -N ""
fi

