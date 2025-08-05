# 📊 Desafio de Projeto: Integrando Dados com MySQL Azure e Transformando com Power BI

Este repositório contém a implementação do desafio prático proposto na plataforma educacional, com foco na integração de uma base de dados hospedada no **MySQL na Azure** e sua transformação e análise no **Power BI**.

---

## 📌 Ementa do Projeto

O projeto foi desenvolvido seguindo as seguintes etapas:

1. Descrição do desafio de projeto
2. Criação de instância do MySQL na Azure
3. Exploração da instância criada
4. Conexão ao banco de dados via **Cloud Shell**
5. Criação de regra de firewall na Azure para permitir acesso ao banco
6. Conexão ao MySQL com o **Workbench**
7. Integração com o Power BI

---

## 🛠️ Descrição Técnica

### 🧱 Etapas Realizadas:

* Criação de uma instância de banco de dados MySQL na Azure.
* Criação e importação de base de dados a partir de arquivos disponíveis no GitHub.
* Integração direta do Power BI com a instância MySQL na Azure.
* Identificação e correção de problemas de qualidade nos dados, com aplicação de transformações.

---

## 🔄 Diretrizes de Transformação de Dados

As transformações foram realizadas com base nas seguintes diretrizes, todas devidamente implementadas:

1. Verificação dos cabeçalhos e tipos de dados ✔️
2. Conversão de valores monetários para o tipo `double` com precisão ✔️
3. Identificação e tratamento de valores nulos ✔️
4. Identificação de funcionários sem `Super_ssn` (possíveis gerentes) ✔️
5. Verificação de departamentos sem gerente ✔️
6. Preenchimento de lacunas em departamentos sem gerente com dados fictícios ✔️
7. Validação da quantidade de horas nos projetos ✔️
8. Separação de colunas complexas ✔️
9. Junção de `employee` com `department` para obter nome do departamento para cada colaborador ✔️
10. Eliminação de colunas desnecessárias ✔️
11. Junção entre colaboradores e nomes de seus respectivos gerentes (realizada no Power BI) ✔️
12. Junção das colunas de Nome e Sobrenome para formar nome completo ✔️
13. Junção dos nomes dos departamentos com suas localizações (para formar chave única por combinação) ✔️
14. Utilização de **mescla** ao invés de **atribuição**, visto que o objetivo era apenas unir as informações, sem criar uma nova base ✔️
    R: Por que neste caso estou querendo apenas juntar as informações e não fazer uma nova consulta baseada na tanela original.
15. Agrupamento dos dados para obter a quantidade de colaboradores por gerente ✔️
16. Eliminação final de colunas que não seriam utilizadas no relatório ✔️
