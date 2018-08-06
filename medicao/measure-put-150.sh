#!/bin/bash
for i in {20..90}
do
  for j in {12..25}
  do
    echo $(gdate +%s%N) "PUT,B" >> requestlogput150.txt
    curl -X PUT -d '{"status":"Em Preparo"}' http://olhonaconta.xyz/dev/leticiawanderley/pedido/$i/item/$j >> dblogput50.txt
    echo $(gdate +%s%N) "PUT,A" >> requestlogput150.txt
    sleep 1s
  done
done
