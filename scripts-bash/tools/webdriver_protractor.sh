#!/bin/bash
echo "Instalando webdriver e Protractor"
npm install --unsafe-perm --save-exact -g protractor && npm update 
export NODE_PATH=/usr/lib/node_modules
npm install --unsafe-perm -g \
            jasmine-reporters \
            jasmine-spec-reporter \
            protractor-jasmine2-html-reporter \
            jasmine-allure-reporter \
            protractor-console

webdriver-manager update

if [[ $? -eq 0 ]]
then
    echo "WebDriver e Protractor instalado com sucesso."
else
    echo "WebDriver e Protractor não instalado."
fi
