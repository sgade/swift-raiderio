#!/bin/bash

set -euo pipefail

OUTPUT="Sources/RaiderIO/openapi.json"
# Since RaiderIO provides a Swagger v2 definition, we need to upgrade it to v3
SOURCE='https://converter.swagger.io/api/convert?url=https%3A%2F%2Fraider.io%2Fswagger.json'

curl \
    -X 'GET' \
    -H 'accept: application/json' \
    "$SOURCE" \
    | sed 's/"url":"https:\/\/raider.io\/"/"url":"https:\/\/raider.io"/g' \
    > "$OUTPUT"
