library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

#post4501GB = read_csv("../result/1gbPost450.csv") %>%
#          gather("tipo_tempo", "valor", 2:3)

post4501GB = read_csv("../result/1gbPost450.csv")
post1501GB = read_csv("../result/1gbPost50.csv")
put4501GB = read_csv("../result/1gbPut450.csv")
put1501GB = read_csv("../result/1gbPut50.csv")

post4501GB$tipo = "Post 250"
post1501GB$tipo = "Post 50"
put4501GB$tipo = "Put 250"
put1501GB$tipo = "Put 50"


dados1GB = post4501GB %>% select(tempoBanco, tempoHTTP, tipo) %>%
        rbind( post1501GB %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
        rbind( put4501GB %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
        rbind( put1501GB %>% select(tempoBanco, tempoHTTP, tipo) )

db1GB %>%
  ggplot(aes(x= tipo, y=tempoBanco)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao banco 1GB RAM", x = "Tipo de requisição", y = "Tempo")

db1GB %>%
  ggplot(aes(x= tipo, y=log(tempoBanco))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao banco 1GB RAM", x = "Tipo de requisição", y = "Tempo em log")

db1GB %>%
  ggplot(aes(x= tipo, y=tempoHTTP)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao servidor 1GB RAM", x = "Tipo de requisição", y = "Tempo")

db1GB %>%
  ggplot(aes(x= tipo, y=log(tempoHTTP))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao servidor 1GB RAM", x = "Tipo de requisição", y = "Tempo em log")


post450500mb = read_csv("../result/500mbPost450.csv")
post150500mb = read_csv("../result/500mbPost50.csv")
put450500mb = read_csv("../result/500mbPut450.csv")
put150500mb = read_csv("../result/500mbPut50.csv")

post450500mb$tipo = "Post 250"
post150500mb$tipo = "Post 50"
put450500mb$tipo = "Put 250"
put150500mb$tipo = "Put 50"

dados500mb = post450500mb %>% select(tempoBanco, tempoHTTP, tipo) %>%
  rbind( post150500mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put450500mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put150500mb %>% select(tempoBanco, tempoHTTP, tipo) )

dados500mb %>%
  ggplot(aes(x= tipo, y=tempoBanco)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao banco 500MB RAM", x = "Tipo de requisição", y = "Tempo")

dados500mb %>%
  ggplot(aes(x= tipo, y=log(tempoBanco))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao banco 500MB RAM", x = "Tipo de requisição", y = "Tempo em log")

dados500mb %>%
  ggplot(aes(x= tipo, y=tempoHTTP)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao servidor 500MB RAM", x = "Tipo de requisição", y = "Tempo")

dados500mb %>%
  ggplot(aes(x= tipo, y=log(tempoHTTP))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao servidor 500MB RAM", x = "Tipo de requisição", y = "Tempo em log")



post450100mb = read_csv("../result/100mbPost450.csv")
post150100mb = read_csv("../result/100mbPost50.csv")
put450100mb = read_csv("../result/100mbPut450.csv")
put150100mb = read_csv("../result/100mbPut50.csv")

post450100mb$tipo = "Post 250"
post150100mb$tipo = "Post 50"
put450100mb$tipo = "Put 250"
put150100mb$tipo = "Put 50"

dados100mb = post450100mb %>% select(tempoBanco, tempoHTTP, tipo) %>%
  rbind( post150100mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put450100mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put150100mb %>% select(tempoBanco, tempoHTTP, tipo) )

dados100mb %>%
  ggplot(aes(x= tipo, y=tempoBanco)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao banco 100MB RAM", x = "Tipo de requisição", y = "Tempo")

dados100mb %>%
  ggplot(aes(x= tipo, y=log(tempoBanco))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao banco 100MB RAM", x = "Tipo de requisição", y = "Tempo em log")

dados100mb %>%
  ggplot(aes(x= tipo, y=tempoHTTP)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao servidor 100MB RAM", x = "Tipo de requisição", y = "Tempo")

dados100mb %>%
  ggplot(aes(x= tipo, y=log(tempoHTTP))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao servidor 100MB RAM", x = "Tipo de requisição", y = "Tempo em log")
