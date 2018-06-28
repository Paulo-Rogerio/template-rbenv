#!/bin/bash

# Adicionando profile no root.
echo "# Carregando profile do usuario sistemas" | tee -a ~/.bashrc >/dev/null
echo "source /etc/profile" | tee -a ~/.bashrc >/dev/null

# Mudando de diretório pós login
echo "# Mudando para o diretório padrao (/var/www)" | tee -a ~/.bashrc >/dev/null
echo "cd /var/www" | tee -a /home/sistemas/.bashrc >/dev/null
