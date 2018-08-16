#!/bin/bash

npm install -g bower
if [[ $? -eq 0 ]]
then
    echo "Bower instalado: $(bower --version)"
else
    echo "Instalando Bower......"
    npm install -g bower
fi