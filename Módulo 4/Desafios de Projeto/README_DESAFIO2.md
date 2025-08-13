# 📊 Descrição do Desafio de Projeto

Utilizaremos a tabela única de **Financial Sample** para criar as tabelas dimensão e fato do nosso modelo baseado em **star schema**.
O processo consiste na criação das tabelas com base na tabela original. A partir da cópia serão selecionadas as colunas que irão compor a visão da nova tabela. Sendo assim, a partir da tabela principal serão criadas as tabelas:

* **Financials\_origem** (modo oculto – backup)
* **D\_Produtos** (ID\_produto, Produto, Média de Unidades Vendidas, Médias do valor de vendas, Mediana do valor de vendas, Valor máximo de Venda, Valor mínimo de Venda)
* **D\_Produtos\_Detalhes** (ID\_produtos, Discount Band, Sale Price, Units Sold, Manufactoring Price)
* **D\_Descontos** (ID\_produto, Discount, Discount Band)
* **D\_Detalhes** (\*)
* **D\_Calendário** – Criada por DAX com `CALENDAR()`
* **F\_Vendas** (SK\_ID, ID\_Produto, Produto, Units Sold, Sales Price, Discount Band, Segment, Country, Salers, Profit, Date (campos))

\* Verifique as informações que não foram contempladas nas demais tabelas dimensão que fornecem maiores detalhes sobre vendas.

---

## 🔄 Processo de Construção do Diagrama

O diagrama foi construído conforme solicitado no desafio, porém com **algumas alterações para manter a cardinalidade das tabelas sempre no formato 1\:N**.
Durante o processo, foi utilizado **DAX** para criar a **tabela de calendário** e também para criar **alguns índices necessários para garantir a cardinalidade correta** entre as tabelas.
A modelagem foi pensada para manter um **esquema em estrela (star schema)** limpo e com relacionamentos bem definidos, evitando relações ambíguas ou de muitos-para-muitos.

---

## ⚙️ Etapas, Funcionalidades e Funções DAX Utilizadas

* **Criação de Chaves Estrangeiras na Tabela Fato**
  As funções **DAX** foram fundamentais para gerar colunas personalizadas que serviram como chaves estrangeiras na **tabela fato**, permitindo relacionamentos diretos e otimizados com as tabelas dimensão.

* **Tabela de Calendário**
  A função `CALENDAR()` foi utilizada para gerar a tabela de calendário completa.
  Com base nela, foi criada também a **hierarquia de datas** (Ano > Trimestre > Mês > Dia), permitindo análises temporais dinâmicas.

* **Colunas Calculadas para Índices**
  Foram criadas colunas calculadas em DAX para gerar identificadores únicos e **garantir a integridade referencial**.

Essas funções facilitaram todo o processo de construção do modelo, especialmente na integração entre as tabelas fato e dimensão.

---
