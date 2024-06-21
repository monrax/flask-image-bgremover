#!/bin/sh

IMAGE_FILE=$1

p1='{"image":"'
p2=$(base64 -i $IMAGE_FILE)
p3='"}'

echo "Testing /v1/remove endpoint..."
curl -H "Content-type:application/json" -d $p1$p2$p3 http://localhost:8080/v1/remove | jq -r '.result|ltrimstr("data:image/png;base64,")' | base64 -d > out-v1.png


p1='{"expr":"'
p2="convert(image,'"'L'"')"
p3='","image":"'
p4=$(base64 -i $IMAGE_FILE)
p5='"}'

echo "Testing /v2/remove endpoint..."
curl -H "Content-type:application/json" -d $p1$p2$p3$p4$p5 http://localhost:8080/v2/remove | jq -r '.result|ltrimstr("data:image/png;base64,")' | base64 -d > out-v2.png
