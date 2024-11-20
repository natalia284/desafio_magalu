# :memo: Desafio Magalu

Este projeto é uma aplicação backend desenvolvida em Ruby, projetada para gerenciar pedidos, usuários, produtos e arquivos. 

# :round_pushpin: Pré-Requisitos

Antes de começar, verifique se você possui os seguintes softwares instalados:

- **Docker** e **Docker Compose** para gerenciar o container do PostgreSQL

# :gear: Uso

O banco de dados utilizado no projeto foi o PostgreSQL. Com o docker instalado, crie o contâiner com o comando a seguir. O servidor será iniciado automaticamente. 
``` bash

# Para o docker com as configurações do banco: 

docker compose up api --build

```
# :open_file_folder: Arquitetura

O projeto está dividido em algumas pastas:  

- Controllers: responsável por lidar com requisições HTTP e retornar respostas (JSON). 
- Models: define as entidades do sistema e interagem diretamente com o banco de dados via ActiveRecord (ORM). 
- Repositories: centraliza consultas e operações no banco de dados, separando lógica de acesso aos dados.
- Services: implementa a lógica de negócio e coordenam chamadas a repositórios e modelos. 
- Db: contém migrações e esquema do banco.

Além disso, optou-se por utilizar a biblioteca Sinatra devido ao seu formato minimalista. 

Desse modo, você pode acessar no Postman o caminho `http://127.0.0.1:9292/upload)` utilizando o método POST e na aba `body` adicionar o arquivo desejado. 
