#!/bin/bash

# Checa se usuario existe.
getent passwd ${USUARIO} >/dev/null

if [[ $? -eq 0 ]]; 
then
    echo "Usuario ${USUARIO} já existe!!!"

else
    groupadd -g 9999 ${USUARIO}
    groupadd -g 9998 desenvolvedores
    useradd -g ${USUARIO} -m -c "Usuario Aplicações Rails" -s "/bin/bash" ${USUARIO}
    gpasswd -a ${USUARIO} desenvolvedores
    su ${USUARIO} -c "mkdir -p /home/${USUARIO}/.ssh"
    chmod 700 /home/${USUARIO}/.ssh
    su ${USUARIO} -c 'ssh-keygen -b 2048 -t rsa -f /home/${USUARIO}/.ssh/id_rsa -q -N ""'
fi

