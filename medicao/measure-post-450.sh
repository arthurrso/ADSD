#!/bin/bash
for i in {20..90}
do
  for j in {12..25}
  do
    echo $(gdate +%s%N) "POST,B" >> requestlogpost450.txt
    curl -X POST -d '{"status":"Em Preparo", "id_pedido":'$i', "id_item":'$j', "perfil":"Perfil", "quantidade":2.0}' http://olhonaconta.xyz/dev/leticiawanderley/pedido/$i/item/$j >> dblogpost250.txt
    echo $(gdate +%s%N) "POST,A" >> requestlogpost450.txt
    sleep .1
  done
done
