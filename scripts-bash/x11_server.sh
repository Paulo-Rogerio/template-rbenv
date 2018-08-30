#!/bin/bash
# X11
Xvfb :99 -ac -listen tcp -screen 0 2560x1440x24 &
PID=$!
EXISTE=$(ps ax | egrep -o "${PID}")
[[ ! -z "${EXISTE}" ]] && echo "X11 Started - Sucess" > /root/servicos.txt || echo "X11 Not Started - Error" > /root/servicos.txt
sleep 5

# FluxBox
/usr/bin/fluxbox -display :99 -screen 0 &
PID=$!
EXISTE=$(ps ax | egrep -o "${PID}")
[[ ! -z "${EXISTE}" ]] && echo "Fluxbox Started - Sucess" >> /root/servicos.txt || echo "Fluxbox Not Started - Error" >> /root/servicos.txt
sleep 5
exec "$@"
