# :memo: Desafio Magalu

Este projeto é uma aplicação backend desenvolvida em Ruby, projetada para gerenciar pedidos, usuários, produtos e arquivos. 

# :round_pushpin: Pré-Requisitos

Antes de começar, verifique se você possui os seguintes softwares instalados:

- **Docker** e **Docker Compose** para gerenciar o container do PostgreSQL

# :rocket: Tecnologias Escolhidas

- **Sinatra**: por se tratar de um framework minimalista, escolhi o Sinatra foi escolhido devido à sua simplicidade.
- **API REST**: escolhi esse padrão por ser um dos mais conhecidos no mercado. 
- **PostgreSQL**: ele foi escolhido devido ao seu bom desempenho para grandes volumes de dados.
- **Docker**: usei para garantir que o ambiente fosse isolado e consistente, evitando instalações na máquina local. 

# :open_file_folder: Arquitetura

O projeto está dividido em algumas camadas:  

- **Controllers**: responsável por lidar com requisições HTTP e retornar respostas (JSON). 
- **Models**: define as entidades do sistema e interagem diretamente com o banco de dados via ActiveRecord (ORM). 
- **Repositories**: centraliza consultas e operações no banco de dados, separando lógica de acesso aos dados.
- **Services**: implementa a lógica de negócio e coordenam chamadas a repositórios e modelos. 

# :gear: Uso

O banco de dados utilizado no projeto foi o PostgreSQL. Com o docker instalado, crie o contâiner com o comando a seguir. O servidor será iniciado automaticamente. 
``` bash

docker compose up api --build

```

# :inbox_tray: Endpoint `/upload`

Este endpoint é responsável por processar arquivos enviados para o sistema, armazenando as informações no banco de dados e retornando uma resposta estruturada no formato JSON.

---

## :link: URL

``` bash

http://127.0.0.1:9292/upload

```
## :electric_plug: Método HTTP

POST

## :open_file_folder: Parâmetros

O corpo da requisição deve conter o arquivo enviado no formato form-data com a seguinte chave: 

- **file**: o arquivo txt a ser processado. 

## :bookmark_tabs: Respostas

``` bash

[
  {
    "user_id": 1,
    "name": "Zazarelli",
    "orders": [
      {
        "order_id": 123,
        "total": "1024.48",
        "date": "2021-12-01",
        "products": [
          {
            "product_id": 111,
            "value": "512.24"
          },
          {
            "product_id": 122,
            "value": "512.24"
          }
        ]
      }
    ]
  }
]

```


