# 📊 Desafio 1 de Modelagem Dimensional

## 🎯 Objetivo

Criar o **diagrama dimensional** – **star schema** – com base no diagrama relacional disponibilizado.

## 🔍 Foco

O foco do modelo é o **professor**, que será o objeto de análise.
A **tabela fato** deve refletir diversos dados sobre:

* Professor
* Cursos ministrados
* Departamento ao qual faz parte

> Não é necessário refletir dados sobre os alunos.

## 📌 O que deve ser feito

* Criar a **tabela fato** contendo o contexto analisado.
* Criar as **tabelas dimensão** com os detalhes relacionados ao contexto.
* Adicionar uma **tabela dimensão de datas**, criando os campos necessários para modelagem.

## 📅 Dimensão de Datas

Para compensar a falta de dados de datas no modelo relacional, deve-se supor que os dados existem e criar os campos necessários, como:

* Data de oferta das disciplinas
* Data de oferta dos cursos

