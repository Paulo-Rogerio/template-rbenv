#!/bin/bash

which webdriver-manager >/dev/null

if [[ $? -eq 0 ]]
then
    echo "WebDriver instalado: $(webdriver-manager version)"
else
    npm install --unsafe-perm --save-exact -g protractor@5.0.0 && npm update && webdriver-manager update
    export NODE_PATH=/usr/lib/node_modules

    npm install --unsafe-perm -g \
        jasmine-reporters \
        jasmine-spec-reporter \
        protractor-jasmine2-html-reporter \
        jasmine-allure-reporter \
        protractor-console
fi
