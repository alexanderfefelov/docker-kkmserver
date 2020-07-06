#!/bin/sh

curl --head --fail --silent --user-agent healthcheck http://localhost:5893/ > /dev/null
