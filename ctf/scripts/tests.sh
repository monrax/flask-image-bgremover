#!/bin/sh

mkdir images

echo "Fetching sample image..."
curl -L -o images/input.jpg "https://github.com/danielgatis/rembg/blob/main/examples/animal-1.jpg?raw=true"
IMAGE_FILE=${1:-"images/input.jpg"}

base64 $IMAGE_FILE | tr -d \\n | jq -Rn '.image = inputs' > input.json

echo "\nTesting /v1/remove endpoint..."
curl -H "Content-type:application/json" -d @input.json http://localhost:8080/v1/remove | jq -r '.result|ltrimstr("data:image/png;base64,")' | base64 -d > images/output-v1.png

jq '.expr = "convert(image,'"'L'"')"' input.json > v2.json && mv v2.json input.json

echo "\nTesting /v2/remove endpoint..."
curl -H "Content-type:application/json" -d @input.json http://localhost:8080/v2/remove | jq -r '.result|ltrimstr("data:image/png;base64,")' | base64 -d > images/output-v2.png

echo "\nAll done! Please, go to port 8081 to check out your images (press cmd/ctrl + c when you are ready to exit this script)"
rm input.json && cd images && python3 -m http.server 8081
