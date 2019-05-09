# Tecnodata - Sistema de gestão online

Sistema integrado ERP e e-Commerce da Tecnomult para gestão interna, providenciando agilidade na organização de estoque, entrada e saída de produtos, vendas online e em loja física com sistema de comissão ao vendedor em cloud.

**Ferramentas:**

* Ruby 2.6.1p33

* Rails 5.2.3

* sqlite3 3.22.0

* MySQL 5.7.26

**Requerimentos:**

* ImageMagick ver 6.9.7-4

* Solidus e-Commerce System

**Instalando:**

Deve-se ter o ImageMagick préviamente instalado na máquina antes de efetuar a instalação do sistema.

Inicie um projeto padrão Ruby on Rails 5 com os seguintes comandos:

```
rvm 2.6.1
rails new <Projeto>
```
Após a criação do projeto, deve-se acessar a Gemfile do projeto gerado e incluir as seguintes gem para continuar a instalação:

```
gem 'solidus'
gem 'solidus_auth_devise'
```
Então rode o comando `bundle` para instalar todas as gems inclusas no arquivo, após a instalação das gems necessárias, rode os comandos abaixo para a criação das configurações necessárias:

```
bundle exec rails g spree:install
bundle exec rails g solidus:auth:install
bundle exec rake railties:install:migrations
```
Rode as migrações para criar os novos modelos no banco de dados

```
bundle exec rake db:migrate
```

Então é só rodar o servidor

```
bundle exec rails s
```

Ao criar o servidor, o site estará acessível pelo `https://localhost:3000/` e o painel de controle acessível pelo `https://localhost:3000/`
