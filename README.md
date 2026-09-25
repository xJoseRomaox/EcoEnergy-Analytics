# EcoEnergy Analytics

## Análise de Dados para Avaliação da Transição para Energias Renováveis

Projeto de análise de dados desenvolvido para investigar tendências e diferenças entre países relacionadas à participação das energias renováveis na geração de eletricidade.

## Objetivo

O objetivo do projeto é utilizar análise de dados para identificar tendências históricas, comparar países e analisar a participação de diferentes fontes de geração de eletricidade.

A questão central do projeto é:

> Como a análise de dados pode auxiliar na identificação de tendências e diferenças entre países relacionadas à participação das energias renováveis na geração de eletricidade?

## Fonte dos dados

Os dados utilizados foram obtidos do **Our World in Data (OWID)**, a partir do conjunto de dados de energia.

Fonte oficial:

https://catalog.ourworldindata.org/energy_data/owid_energy/

Repositório oficial:

https://github.com/owid/energy-data

## Dados utilizados

Após a importação e validação, a base apresentou:

- 23.377 registros;
- período de 1900 a 2025;
- 314 países e regiões;
- 221 códigos ISO.

Entre os principais indicadores utilizados estão:

- população;
- PIB;
- geração de eletricidade;
- demanda de eletricidade;
- geração renovável;
- participação das energias renováveis;
- participação dos combustíveis fósseis;
- geração hidrelétrica;
- geração solar;
- geração eólica.

## Tratamento e análise

O tratamento e a análise dos dados foram realizados utilizando **MySQL e SQL**.

Foram realizadas etapas de:

- importação dos dados;
- validação;
- tratamento de valores nulos;
- verificação de duplicidades;
- análise de consistência;
- estatísticas descritivas;
- análise temporal;
- comparação entre países;
- análise do Brasil;
- análise de geração renovável per capita;
- análise de correlação entre variáveis.

Também foram criadas variáveis derivadas para ampliar as possibilidades de análise.

## Principais resultados

A análise identificou as seguintes médias na base utilizada:

| Indicador | Média |
|---|---:|
| Energias renováveis | 29,99% |
| Combustíveis fósseis | 64,95% |
| Hidrelétrica | 25,09% |
| Solar | 1,12% |
| Eólica | 1,71% |

Entre 1985–1999, a participação média das energias renováveis foi de aproximadamente 25,75%.

Entre 2020–2025, esse valor passou para aproximadamente 36,68%.

Também foi observado crescimento das fontes solar e eólica ao longo dos períodos mais recentes analisados.

## Dashboard

Os resultados foram apresentados em um dashboard desenvolvido no **Google Looker Studio**.

O dashboard possui três áreas principais:

1. Visão Geral;
2. Comparação Internacional;
3. Brasil.

### Acessar o dashboard

[🔗 Abrir o Dashboard EcoEnergy Analytics](https://datastudio.google.com/reporting/c89a8fe1-a480-40c6-aaa5-7e2752791a76)

## Documentação

A documentação detalhada do projeto está disponível em:

[📄 Documentação do projeto](docs/projeto.md)

A documentação apresenta:

- coleta de dados;
- modelagem;
- tratamento;
- análise exploratória;
- resultados;
- análise do Brasil;
- conclusões;
- limitações.

## Scripts SQL

Os scripts utilizados no projeto estão disponíveis neste repositório.

## Estrutura do projeto

```text
EcoEnergy-Analytics/
│
├── README.md
│
├── dashboard/
│   └── README.md
│
├── docs/
│   └── projeto.md
│
└── sql/
    └── EcoEnergy_Analytics_Completo.sql
