#!/bin/bash

# Copyright (C) 2025 ITlopa
# The Ituxalien Script language (written in Bash)

evaluate() {
    local expression="$1"
    echo $((expression))
}

while true; do
    echo -n "> "
    read line

    if [[ "$line" == "exit" ]]; then
        break
    fi

    if [[ "$line" =~ ^let\ ([a-zA-Z_][a-zA-Z0-9_]*)\ =\ (.*)$ ]]; then
        var_name="${BASH_REMATCH[1]}"
        value="${BASH_REMATCH[2]}"
        eval "$var_name=$(evaluate "$value")"
        echo "$var_name = ${!var_name}"
    fi

    if [[ "$line" =~ ^string\ ([a-zA-Z_][a-zA-Z0-9_]*)\ =\ (.*)$ ]]; then
        var_name="${BASH_REMATCH[1]}"
        value="${BASH_REMATCH[2]}"
        eval "$var_name=$(evaluate "$value")"
        echo "$var_name = ${!var_name}"
    fi

    if [[ "$line" =~ ^print\ (.*)$ ]]; then
        value="${BASH_REMATCH[1]}"
        eval "echo ${value}"
    fi
done
