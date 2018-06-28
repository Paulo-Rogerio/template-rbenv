#!/bin/bash
cd `dirname $0`

# Ajuste no Bash
if [ $(readlink /bin/sh) == "/bin/bash" ];
then
  echo "Bash Padrão /bin/bash"
else
  rm -f /bin/sh
  ln -s /bin/bash /bin/sh
fi

for i in $(ls tools/*.sh | sort)
do
  bash ${i}
done
