#!/bin/bash

JSON_PATH=$HOME/.config/niri/swaybg.json

size=$(jq 'length' $JSON_PATH)
index=$(( RANDOM % size ))

path=$(eval echo $(jq -r --arg i "$index" '.[$i | tonumber].path' $JSON_PATH))
mode=$(jq -r --arg i "$index" '.[$i | tonumber].mode' $JSON_PATH)

swaybg -m "$mode" -i "$path"
