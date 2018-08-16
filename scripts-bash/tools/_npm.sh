#!/bin/bash
echo "Atualizando NPM..."
npm install npm@latest -g

if [[ $? -eq 0 ]]
then
    echo "Sucesso ao Atulizar!!"
else
    echo "Error ao Atulizar!!"
fi    
