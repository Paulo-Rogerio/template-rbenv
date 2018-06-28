#!/bin/bash

if [[ ! -e "/etc/profile.d/desenvolvedores_to_sistemas.sh" ]]
then
    echo "#!/bin/bash" | tee /etc/profile.d/desenvolvedores_to_sistemas.sh >/dev/null
    echo 'if [[ $(id -u) -eq 0 ]]
then
    if [[ $(whoami) != "sistemas" ]]; then su - sistemas; fi
fi' | tee -a /etc/profile.d/desenvolvedores_to_sistemas.sh >/dev/null

fi