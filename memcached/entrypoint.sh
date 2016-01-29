#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    /usr/bin/memcached -m 128
else
    /usr/bin/memcached -m "$@"
fi
