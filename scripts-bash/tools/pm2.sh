#!/bin/bash
echo "Instalando Pm2..."

npm install pm2 -g

if [[ $? -eq 0 ]]
then
    echo "Sucesso ao Instalar!!"
else
    echo "Error ao Instalar!!"
fi    
