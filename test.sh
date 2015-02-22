#!/bin/bash

test_node() {
    host_port=$1

    curl -s --connect-timeout 5 --max-time 10 $host_port | grep -q 'Hello World!'
    if [[ $? -eq 0 ]]; then
        echo Node $host_port is up
    else
        echo Node $host_port is down
    fi
}

test_node 10.0.0.2:80
test_node 10.0.0.3:8000
test_node 10.0.0.4:8000
