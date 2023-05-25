# TodoRails - Organize seu trabalho e sua vida

## Descrição 
Aplicativo de lista de tarefas para organizar seu trabalho e sua vida.

## Apresentação


## Tecnologias usuadas
- [Ruby on Rails](https://rubyonrails.org/)

## Instruções 

```bash
$ rvm use 3.1.1@todo-rails --create
$ bundle install
$ npm install
```

> **_NOTE:_**  [Instalar ruby on rails em sua máquina](https://onebitcode.com/guia-de-instalacao-do-ruby-on-rails/)

## Executando o serviço
```bash
rails db:create 
rails db:migrate 
rake seed:migrate

bin/dev
```


## Docker Instruções
1. docker compose build
2. docker compose run --rm app todo db:create 
3. docker compose run --rm app todo db:migrate 
4. docker compose run --rm app rake seed:migrate

## Executar o Docker
1. docker compose run --rm -p 3000:3000 todo s -b 0.0.0.0

