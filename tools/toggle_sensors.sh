#!/bin/sh

function warning {
    echo "`basename $0`: Warning: ${@:1}" 1>&2;
}

function service_do {
    if systemctl $1 $2; then
        return 0;
    else
        warning "Status $?" "on $1 $2" ${@:3}
        return 1;
    fi
}

function get_state {
  state=$(systemctl status $1 | grep "Active: " | awk '{print $2}')
  if [[ $state == "active" ]]; then 
    return 1;
  else
    return 0;
  fi
}
sname="sensorfwd"

if get_state $sname; then 
  service_do start $sname
else
  service_do stop $sname
fi 
