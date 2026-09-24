# EcoEnergy Analytics — Documentação do Projeto

## 1. Coleta de dados

### 1.1 Fonte dos dados

Os dados utilizados neste projeto foram obtidos do **Our World in Data (OWID)**, uma plataforma que disponibiliza dados públicos para análise de diferentes questões globais.

Foi utilizado o conjunto de dados de energia disponibilizado pelo OWID, contendo informações históricas sobre consumo, produção e geração de eletricidade por país ou região.

Fonte oficial:

https://catalog.ourworldindata.org/energy_data/owid_energy/

Repositório oficial:

https://github.com/owid/energy-data

### 1.2 Dados utilizados

O conjunto de dados utilizado possui informações referentes a diferentes indicadores de energia, incluindo:

- país ou região;
- código ISO;
- ano;
- população;
- PIB;
- geração de eletricidade;
- geração de eletricidade renovável;
- participação das energias renováveis;
- participação dos combustíveis fósseis;
- geração hidrelétrica;
- geração solar;
- geração eólica;
- entre outros indicadores relacionados à energia.

Após a importação e validação, a base utilizada no projeto apresentou:

- **23.377 registros**;
- período entre **1900 e 2025**;
- **314 países e regiões**;
- **221 códigos ISO**.

### 1.3 Método de coleta

O arquivo de dados foi obtido a partir da base pública disponibilizada pelo Our World in Data.

O arquivo foi posteriormente importado para o **MySQL**, onde foram realizadas as etapas de validação, tratamento, transformação e análise dos dados.

O projeto foi desenvolvido utilizando **MySQL**, sem utilização de Python para as etapas de tratamento e análise.

---

# 2. Modelagem e tratamento dos dados

## 2.1 Estrutura da base

A base original foi inicialmente armazenada em uma tabela denominada:

`energy_raw`

Essa tabela foi utilizada como camada de dados brutos, preservando as informações provenientes da fonte original.

Posteriormente, foi criada a tabela:

`energy_clean`

Essa tabela contém as variáveis selecionadas para as análises do projeto.

Entre as principais variáveis utilizadas estão:

- `country`
- `year`
- `iso_code`
- `population`
- `gdp`
- `electricity_generation`
- `electricity_demand`
- `renewables_electricity`
- `renewables_share_elec`
- `fossil_share_elec`
- `hydro_share_elec`
- `solar_share_elec`
- `wind_share_elec`

## 2.2 Tratamento dos dados

Durante o processo de importação e tratamento foram realizadas verificações de:

- quantidade de registros;
- período temporal;
- países e regiões;
- códigos ISO;
- valores nulos;
- registros duplicados;
- consistência dos percentuais;
- valores mínimos e máximos;
- estatísticas descritivas.

Os campos vazios presentes no arquivo original foram tratados como valores nulos durante a importação.

Esse procedimento permitiu diferenciar valores realmente iguais a zero de valores que não possuíam informação disponível.

## 2.3 Variáveis derivadas

Foram criadas variáveis derivadas para ampliar as possibilidades de análise.

### Diferença entre renováveis e fósseis

Foi criada a variável:

`renewable_vs_fossil_gap`

Calculada pela diferença entre a participação das energias renováveis e a participação dos combustíveis fósseis na geração de eletricidade.

### Geração renovável per capita

Também foi criada a variável:

`renewable_generation_per_capita_kwh`

Essa variável relaciona a geração de eletricidade renovável com a população do país ou região, permitindo uma análise da geração renovável por habitante.

## 2.4 Análise exploratória

Após o tratamento, foram realizadas análises utilizando SQL no MySQL.

Entre as análises realizadas estão:

- estatísticas descritivas;
- evolução temporal das energias renováveis;
- comparação entre fontes renováveis;
- comparação entre renováveis e combustíveis fósseis;
- comparação entre países;
- análise específica do Brasil;
- geração renovável per capita;
- análise da relação entre população e demanda de eletricidade;
- análise da relação entre PIB e geração de eletricidade.

---

# 3. Principais resultados

A análise identificou uma participação média de aproximadamente:

| Indicador | Média |
|---|---:|
| Energias renováveis | 29,99% |
| Combustíveis fósseis | 64,95% |
| Hidrelétrica | 25,09% |
| Solar | 1,12% |
| Eólica | 1,71% |

Considerando o período de 1985 a 2025, observou-se uma expansão da participação das energias renováveis na geração de eletricidade.

A média das energias renováveis passou de aproximadamente **25,75% no período de 1985–1999** para **36,68% entre 2020–2025**.

No mesmo período, houve crescimento da participação das fontes solar e eólica.

A participação média da energia solar passou de aproximadamente **0% entre 1985–1999** para **4,70% entre 2020–2025**.

A participação média da energia eólica passou de aproximadamente **0,05% para 4,84%** nos mesmos períodos.

Também foi observada uma redução da participação média dos combustíveis fósseis, de aproximadamente **65,67% para 59,21%**.

---

# 4. Análise do Brasil

O Brasil apresentou elevada participação de fontes renováveis na geração de eletricidade ao longo da série analisada.

Em 1985, a participação das energias renováveis na geração de eletricidade brasileira era de aproximadamente **92,10%**.

Em 2025, o indicador registrado na base foi de aproximadamente **86,60%**.

Apesar da redução da participação total, a composição das fontes renováveis apresentou mudanças importantes.

A participação hidrelétrica passou de aproximadamente **92,10% em 1985 para 51,78% em 2025**.

No mesmo período:

- a participação solar passou de **0% para 11,81%**;
- a participação eólica passou de **0% para 15,67%**.

Os dados indicam uma maior diversificação da composição da geração renovável brasileira ao longo da série analisada.

---

# 5. Relações identificadas

A análise também avaliou relações entre variáveis econômicas, populacionais e energéticas.

Foi identificada uma correlação de **0,9925** entre PIB e geração de eletricidade nos registros disponíveis para essas variáveis.

Também foi identificada uma correlação de **0,8993** entre população e demanda de eletricidade.

Esses resultados indicam associações positivas fortes entre essas variáveis na base analisada.

Essas correlações não devem ser interpretadas como relações de causalidade.

---

# 6. Dashboard

Os resultados foram organizados em um dashboard desenvolvido no **Google Looker Studio**.

O dashboard apresenta:

- indicadores gerais;
- evolução temporal das energias renováveis;
- comparação entre renováveis e fósseis;
- evolução das principais fontes renováveis;
- comparação entre países;
- mapa de participação das renováveis;
- análise específica do Brasil.

O dashboard complementa a análise realizada no MySQL, permitindo uma apresentação visual dos resultados.

---

# 7. Conclusões

A análise dos dados demonstra uma evolução da participação das energias renováveis na geração de eletricidade ao longo do período analisado.

Os resultados também mostram mudanças na composição das fontes renováveis, especialmente com o crescimento das fontes solar e eólica.

A energia hidrelétrica permanece relevante na base analisada, mas sua participação relativa apresenta comportamento diferente das fontes solar e eólica, que apresentam crescimento ao longo dos anos mais recentes.

No caso brasileiro, os dados indicam uma elevada participação histórica das fontes renováveis e, ao mesmo tempo, uma diversificação da composição da matriz renovável, com aumento das participações solar e eólica.

Dessa forma, a análise de dados permite identificar tendências históricas, comparar diferentes países e fontes de geração e apoiar a compreensão das mudanças observadas no setor elétrico.

---

# 8. Limitações

Os resultados dependem da disponibilidade e qualidade dos dados publicados pelo Our World in Data e pelas fontes utilizadas na composição da base.

Também é importante observar que o ano de **2025 possui cobertura parcial na base utilizada**, apresentando menos registros do que vários anos anteriores. Por esse motivo, os resultados referentes a 2025 devem ser interpretados com cautela.

Além disso, correlações identificadas entre variáveis não representam necessariamente relações de causa e efeito.

---

# 9. Tecnologias utilizadas

- MySQL
- SQL
- Google Sheets
- Google Looker Studio
- GitHub
- Markdown

## Fonte

Our World in Data — Energy Dataset.

https://catalog.ourworldindata.org/energy_data/owid_energy/

## Projeto

EcoEnergy Analytics — Análise de Dados para Avaliação da Transição para Energias Renováveis
