#!/usr/bin/env bash

workspaces() {
  hyprctl workspaces -j | jq -Mc '[.[] | {id: .id | tostring, windows: .windows | tostring}]'
}

workspaces

if [[ $1 == 'workspaces' ]]; then
  socat -u "UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" - | while read -r line; do
    active=$(eww get workspaces | jq .active)

    if [ -z "$active" ]; then
      active='1'
    fi

    if [[ ${line:0:9} == 'workspace' ]]; then
      active=${line:11:2}
    fi

    active_empty='true'

    ((i = active - 1)) || true

    if [[ $(workspaces | jq --raw-output .[$i].windows) -gt 0 ]]; then active_empty='false'; fi

    eww update workspaces="{
            \"workspaces\": $(workspaces),
            \"active\": $active,
            \"active_empty\": $active_empty
        }"
  done
fi
