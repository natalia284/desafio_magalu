# :memo: Desafio Magalu

Este projeto é uma aplicação backend desenvolvida em Ruby, projetada para gerenciar pedidos, usuários, produtos e arquivos. 

# :round_pushpin: Pré-Requisitos

Antes de começar, verifique se você possui os seguintes softwares instalados:

- **Ruby** (versão utilizada: 3.0.2)
- **Docker** e **Docker Compose** para gerenciar o container do PostgreSQL

# :cd: Clonagem

``` bash
# Clone o repositório para seu ambiente local usando o comando abaixo:

git clone https://github.com/natalia284/desafio_magalu.git

```
# :game_die: Configuração do Banco de Dados

O banco de dados utilizado no projeto foi o PostgreSQL. Com o docker instalado, crie o contâiner com o comando a seguir. O servidor será iniciado automaticamente. 
``` bash

# Para o docker com as configurações do banco: 

docker compose up api --build

```

Caso queira reiniciar as configurações do banco, faça: 
``` bash

# Reinicia as configurações do banco

docker compose down

```

Desse modo, você pode acessar no Postman o caminho `http://127.0.0.1:9292/upload)` utilizando o método POST e na aba `body` adicionar o arquivo desejado. 
