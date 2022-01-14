#/opt/homebrew/bin/bash

# Description: Restarts a remote VNC server with the resolution specified by arg[1].

# Requires control of the VNC serever via `vncserver` from PATH.

# PARAMS
rhost=slak@192.168.2.4
defres="1440x900"
port=1 # 590<$port>
name="virtual"

read -p "Res (default $defres): " res
if [ -z $res ]; then
    res=$defres
fi

echo

ssh $rhost "vncserver -kill :$port; vncserver -geometry $res -name $name"
