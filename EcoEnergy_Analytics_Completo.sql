DROP DATABASE IF EXISTS ecoenergy_analytics;
CREATE DATABASE ecoenergy_analytics CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecoenergy_analytics;

DROP TABLE IF EXISTS energy_raw;

CREATE TABLE energy_raw (
    country VARCHAR(150), year INT, iso_code VARCHAR(10), population DOUBLE, gdp DOUBLE,
    biofuel_cons_change_pct DOUBLE, biofuel_cons_change_twh DOUBLE, biofuel_cons_per_capita DOUBLE, biofuel_consumption DOUBLE, biofuel_elec_per_capita DOUBLE, biofuel_electricity DOUBLE, biofuel_share_elec DOUBLE, biofuel_share_energy DOUBLE,
    carbon_intensity_elec DOUBLE,
    coal_cons_change_pct DOUBLE, coal_cons_change_twh DOUBLE, coal_cons_per_capita DOUBLE, coal_consumption DOUBLE, coal_elec_per_capita DOUBLE, coal_electricity DOUBLE, coal_prod_change_pct DOUBLE, coal_prod_change_twh DOUBLE, coal_prod_per_capita DOUBLE, coal_production DOUBLE, coal_share_elec DOUBLE, coal_share_energy DOUBLE,
    electricity_demand DOUBLE, electricity_demand_per_capita DOUBLE, electricity_generation DOUBLE, electricity_share_energy DOUBLE,
    energy_cons_change_pct DOUBLE, energy_cons_change_twh DOUBLE, energy_per_capita DOUBLE, energy_per_gdp DOUBLE,
    fossil_cons_change_pct DOUBLE, fossil_cons_change_twh DOUBLE, fossil_elec_per_capita DOUBLE, fossil_electricity DOUBLE, fossil_energy_per_capita DOUBLE, fossil_fuel_consumption DOUBLE, fossil_share_elec DOUBLE, fossil_share_energy DOUBLE,
    gas_cons_change_pct DOUBLE, gas_cons_change_twh DOUBLE, gas_consumption DOUBLE, gas_elec_per_capita DOUBLE, gas_electricity DOUBLE, gas_energy_per_capita DOUBLE, gas_prod_change_pct DOUBLE, gas_prod_change_twh DOUBLE, gas_prod_per_capita DOUBLE, gas_production DOUBLE, gas_share_elec DOUBLE, gas_share_energy DOUBLE,
    greenhouse_gas_emissions DOUBLE,
    hydro_cons_change_pct DOUBLE, hydro_cons_change_twh DOUBLE, hydro_consumption DOUBLE, hydro_elec_per_capita DOUBLE, hydro_electricity DOUBLE, hydro_energy_per_capita DOUBLE, hydro_share_elec DOUBLE, hydro_share_energy DOUBLE,
    low_carbon_cons_change_pct DOUBLE, low_carbon_cons_change_twh DOUBLE, low_carbon_consumption DOUBLE, low_carbon_elec_per_capita DOUBLE, low_carbon_electricity DOUBLE, low_carbon_energy_per_capita DOUBLE, low_carbon_share_elec DOUBLE, low_carbon_share_energy DOUBLE,
    net_elec_imports DOUBLE, net_elec_imports_share_demand DOUBLE,
    nuclear_cons_change_pct DOUBLE, nuclear_cons_change_twh DOUBLE, nuclear_consumption DOUBLE, nuclear_elec_per_capita DOUBLE, nuclear_electricity DOUBLE, nuclear_energy_per_capita DOUBLE, nuclear_share_elec DOUBLE, nuclear_share_energy DOUBLE,
    oil_cons_change_pct DOUBLE, oil_cons_change_twh DOUBLE, oil_consumption DOUBLE, oil_elec_per_capita DOUBLE, oil_electricity DOUBLE, oil_energy_per_capita DOUBLE, oil_prod_change_pct DOUBLE, oil_prod_change_twh DOUBLE, oil_prod_per_capita DOUBLE, oil_production DOUBLE, oil_share_elec DOUBLE, oil_share_energy DOUBLE,
    other_renewable_consumption DOUBLE, other_renewable_electricity DOUBLE, other_renewable_exc_biofuel_electricity DOUBLE, other_renewables_cons_change_pct DOUBLE, other_renewables_cons_change_twh DOUBLE, other_renewables_elec_per_capita DOUBLE, other_renewables_elec_per_capita_exc_biofuel DOUBLE, other_renewables_energy_per_capita DOUBLE, other_renewables_share_elec DOUBLE, other_renewables_share_elec_exc_biofuel DOUBLE, other_renewables_share_energy DOUBLE,
    per_capita_electricity DOUBLE, primary_energy_consumption DOUBLE,
    renewables_cons_change_pct DOUBLE, renewables_cons_change_twh DOUBLE, renewables_consumption DOUBLE, renewables_elec_per_capita DOUBLE, renewables_electricity DOUBLE, renewables_energy_per_capita DOUBLE, renewables_share_elec DOUBLE, renewables_share_energy DOUBLE,
    solar_cons_change_pct DOUBLE, solar_cons_change_twh DOUBLE, solar_consumption DOUBLE, solar_elec_per_capita DOUBLE, solar_electricity DOUBLE, solar_energy_per_capita DOUBLE, solar_share_elec DOUBLE, solar_share_energy DOUBLE,
    wind_cons_change_pct DOUBLE, wind_cons_change_twh DOUBLE, wind_consumption DOUBLE, wind_elec_per_capita DOUBLE, wind_electricity DOUBLE, wind_energy_per_capita DOUBLE, wind_share_elec DOUBLE, wind_share_energy DOUBLE
);

USE ecoenergy_analytics;

LOAD DATA LOCAL INFILE 'C:/Projeto Final MySQL/Parceria/owid-energy-data.csv'
INTO TABLE energy_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_registros
FROM energy_raw;

SHOW WARNINGS;

USE ecoenergy_analytics;

SELECT COUNT(*) AS total_registros
FROM energy_raw;

SELECT COUNT(*) AS total_colunas
FROM information_schema.columns
WHERE table_schema = 'ecoenergy_analytics'
  AND table_name = 'energy_raw';
  
  USE ecoenergy_analytics;

SELECT COUNT(*) AS total_registros
FROM energy_raw;

SELECT 
    MIN(year) AS primeiro_ano,
    MAX(year) AS ultimo_ano
FROM energy_raw;

SELECT COUNT(DISTINCT country) AS total_paises_regioes
FROM energy_raw;

SELECT COUNT(DISTINCT iso_code) AS total_iso_codes
FROM energy_raw;

SELECT *
FROM energy_raw
LIMIT 10;

SELECT
    COUNT(*) AS total_registros,

    SUM(country IS NULL OR TRIM(country) = '') AS country_nulos,

    SUM(year IS NULL) AS year_nulos,

    SUM(iso_code IS NULL OR TRIM(iso_code) = '') AS iso_nulos,

    SUM(population IS NULL) AS population_nulos,

    SUM(gdp IS NULL) AS gdp_nulos,

    SUM(electricity_demand IS NULL) AS electricity_demand_nulos,

    SUM(electricity_generation IS NULL) AS electricity_generation_nulos,

    SUM(renewables_electricity IS NULL) AS renewables_electricity_nulos,

    SUM(renewables_share_elec IS NULL) AS renewables_share_elec_nulos,

    SUM(solar_electricity IS NULL) AS solar_electricity_nulos,

    SUM(wind_electricity IS NULL) AS wind_electricity_nulos,

    SUM(hydro_electricity IS NULL) AS hydro_electricity_nulos,

    SUM(fossil_electricity IS NULL) AS fossil_electricity_nulos

FROM energy_raw;

SELECT
    country,
    year,
    COUNT(*) AS quantidade
FROM energy_raw
GROUP BY country, year
HAVING COUNT(*) > 1
ORDER BY quantidade DESC;

  

---


SELECT COUNT(*) AS total_registros
FROM energy_clean;

SELECT *
FROM energy_clean
LIMIT 10;


USE ecoenergy_analytics;

DROP TABLE IF EXISTS energy_clean;
TRUNCATE TABLE energy_raw;

LOAD DATA LOCAL INFILE 'C:/Projeto Final MySQL/Parceria/owid-energy-data.csv'
INTO TABLE energy_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@country,
@year,
@iso_code,
@population,
@gdp,
@biofuel_cons_change_pct,
@biofuel_cons_change_twh,
@biofuel_cons_per_capita,
@biofuel_consumption,
@biofuel_elec_per_capita,
@biofuel_electricity,
@biofuel_share_elec,
@biofuel_share_energy,
@carbon_intensity_elec,
@coal_cons_change_pct,
@coal_cons_change_twh,
@coal_cons_per_capita,
@coal_consumption,
@coal_elec_per_capita,
@coal_electricity,
@coal_prod_change_pct,
@coal_prod_change_twh,
@coal_prod_per_capita,
@coal_production,
@coal_share_elec,
@coal_share_energy,
@electricity_demand,
@electricity_demand_per_capita,
@electricity_generation,
@electricity_share_energy,
@energy_cons_change_pct,
@energy_cons_change_twh,
@energy_per_capita,
@energy_per_gdp,
@fossil_cons_change_pct,
@fossil_cons_change_twh,
@fossil_elec_per_capita,
@fossil_electricity,
@fossil_energy_per_capita,
@fossil_fuel_consumption,
@fossil_share_elec,
@fossil_share_energy,
@gas_cons_change_pct,
@gas_cons_change_twh,
@gas_consumption,
@gas_elec_per_capita,
@gas_electricity,
@gas_energy_per_capita,
@gas_prod_change_pct,
@gas_prod_change_twh,
@gas_prod_per_capita,
@gas_production,
@gas_share_elec,
@gas_share_energy,
@greenhouse_gas_emissions,
@hydro_cons_change_pct,
@hydro_cons_change_twh,
@hydro_consumption,
@hydro_elec_per_capita,
@hydro_electricity,
@hydro_energy_per_capita,
@hydro_share_elec,
@hydro_share_energy,
@low_carbon_cons_change_pct,
@low_carbon_cons_change_twh,
@low_carbon_consumption,
@low_carbon_elec_per_capita,
@low_carbon_electricity,
@low_carbon_energy_per_capita,
@low_carbon_share_elec,
@low_carbon_share_energy,
@net_elec_imports,
@net_elec_imports_share_demand,
@nuclear_cons_change_pct,
@nuclear_cons_change_twh,
@nuclear_consumption,
@nuclear_elec_per_capita,
@nuclear_electricity,
@nuclear_energy_per_capita,
@nuclear_share_elec,
@nuclear_share_energy,
@oil_cons_change_pct,
@oil_cons_change_twh,
@oil_consumption,
@oil_elec_per_capita,
@oil_electricity,
@oil_energy_per_capita,
@oil_prod_change_pct,
@oil_prod_change_twh,
@oil_prod_per_capita,
@oil_production,
@oil_share_elec,
@oil_share_energy,
@other_renewable_consumption,
@other_renewable_electricity,
@other_renewable_exc_biofuel_electricity,
@other_renewables_cons_change_pct,
@other_renewables_cons_change_twh,
@other_renewables_elec_per_capita,
@other_renewables_elec_per_capita_exc_biofuel,
@other_renewables_energy_per_capita,
@other_renewables_share_elec,
@other_renewables_share_elec_exc_biofuel,
@other_renewables_share_energy,
@per_capita_electricity,
@primary_energy_consumption,
@renewables_cons_change_pct,
@renewables_cons_change_twh,
@renewables_consumption,
@renewables_elec_per_capita,
@renewables_electricity,
@renewables_energy_per_capita,
@renewables_share_elec,
@renewables_share_energy,
@solar_cons_change_pct,
@solar_cons_change_twh,
@solar_consumption,
@solar_elec_per_capita,
@solar_electricity,
@solar_energy_per_capita,
@solar_share_elec,
@solar_share_energy,
@wind_cons_change_pct,
@wind_cons_change_twh,
@wind_consumption,
@wind_elec_per_capita,
@wind_electricity,
@wind_energy_per_capita,
@wind_share_elec,
@wind_share_energy)
SET
    country = NULLIF(TRIM(@country), ''),
    year = NULLIF(TRIM(@year), ''),
    iso_code = NULLIF(TRIM(@iso_code), ''),
    population = NULLIF(TRIM(@population), ''),
    gdp = NULLIF(TRIM(@gdp), ''),
    biofuel_cons_change_pct = NULLIF(TRIM(@biofuel_cons_change_pct), ''),
    biofuel_cons_change_twh = NULLIF(TRIM(@biofuel_cons_change_twh), ''),
    biofuel_cons_per_capita = NULLIF(TRIM(@biofuel_cons_per_capita), ''),
    biofuel_consumption = NULLIF(TRIM(@biofuel_consumption), ''),
    biofuel_elec_per_capita = NULLIF(TRIM(@biofuel_elec_per_capita), ''),
    biofuel_electricity = NULLIF(TRIM(@biofuel_electricity), ''),
    biofuel_share_elec = NULLIF(TRIM(@biofuel_share_elec), ''),
    biofuel_share_energy = NULLIF(TRIM(@biofuel_share_energy), ''),
    carbon_intensity_elec = NULLIF(TRIM(@carbon_intensity_elec), ''),
    coal_cons_change_pct = NULLIF(TRIM(@coal_cons_change_pct), ''),
    coal_cons_change_twh = NULLIF(TRIM(@coal_cons_change_twh), ''),
    coal_cons_per_capita = NULLIF(TRIM(@coal_cons_per_capita), ''),
    coal_consumption = NULLIF(TRIM(@coal_consumption), ''),
    coal_elec_per_capita = NULLIF(TRIM(@coal_elec_per_capita), ''),
    coal_electricity = NULLIF(TRIM(@coal_electricity), ''),
    coal_prod_change_pct = NULLIF(TRIM(@coal_prod_change_pct), ''),
    coal_prod_change_twh = NULLIF(TRIM(@coal_prod_change_twh), ''),
    coal_prod_per_capita = NULLIF(TRIM(@coal_prod_per_capita), ''),
    coal_production = NULLIF(TRIM(@coal_production), ''),
    coal_share_elec = NULLIF(TRIM(@coal_share_elec), ''),
    coal_share_energy = NULLIF(TRIM(@coal_share_energy), ''),
    electricity_demand = NULLIF(TRIM(@electricity_demand), ''),
    electricity_demand_per_capita = NULLIF(TRIM(@electricity_demand_per_capita), ''),
    electricity_generation = NULLIF(TRIM(@electricity_generation), ''),
    electricity_share_energy = NULLIF(TRIM(@electricity_share_energy), ''),
    energy_cons_change_pct = NULLIF(TRIM(@energy_cons_change_pct), ''),
    energy_cons_change_twh = NULLIF(TRIM(@energy_cons_change_twh), ''),
    energy_per_capita = NULLIF(TRIM(@energy_per_capita), ''),
    energy_per_gdp = NULLIF(TRIM(@energy_per_gdp), ''),
    fossil_cons_change_pct = NULLIF(TRIM(@fossil_cons_change_pct), ''),
    fossil_cons_change_twh = NULLIF(TRIM(@fossil_cons_change_twh), ''),
    fossil_elec_per_capita = NULLIF(TRIM(@fossil_elec_per_capita), ''),
    fossil_electricity = NULLIF(TRIM(@fossil_electricity), ''),
    fossil_energy_per_capita = NULLIF(TRIM(@fossil_energy_per_capita), ''),
    fossil_fuel_consumption = NULLIF(TRIM(@fossil_fuel_consumption), ''),
    fossil_share_elec = NULLIF(TRIM(@fossil_share_elec), ''),
    fossil_share_energy = NULLIF(TRIM(@fossil_share_energy), ''),
    gas_cons_change_pct = NULLIF(TRIM(@gas_cons_change_pct), ''),
    gas_cons_change_twh = NULLIF(TRIM(@gas_cons_change_twh), ''),
    gas_consumption = NULLIF(TRIM(@gas_consumption), ''),
    gas_elec_per_capita = NULLIF(TRIM(@gas_elec_per_capita), ''),
    gas_electricity = NULLIF(TRIM(@gas_electricity), ''),
    gas_energy_per_capita = NULLIF(TRIM(@gas_energy_per_capita), ''),
    gas_prod_change_pct = NULLIF(TRIM(@gas_prod_change_pct), ''),
    gas_prod_change_twh = NULLIF(TRIM(@gas_prod_change_twh), ''),
    gas_prod_per_capita = NULLIF(TRIM(@gas_prod_per_capita), ''),
    gas_production = NULLIF(TRIM(@gas_production), ''),
    gas_share_elec = NULLIF(TRIM(@gas_share_elec), ''),
    gas_share_energy = NULLIF(TRIM(@gas_share_energy), ''),
    greenhouse_gas_emissions = NULLIF(TRIM(@greenhouse_gas_emissions), ''),
    hydro_cons_change_pct = NULLIF(TRIM(@hydro_cons_change_pct), ''),
    hydro_cons_change_twh = NULLIF(TRIM(@hydro_cons_change_twh), ''),
    hydro_consumption = NULLIF(TRIM(@hydro_consumption), ''),
    hydro_elec_per_capita = NULLIF(TRIM(@hydro_elec_per_capita), ''),
    hydro_electricity = NULLIF(TRIM(@hydro_electricity), ''),
    hydro_energy_per_capita = NULLIF(TRIM(@hydro_energy_per_capita), ''),
    hydro_share_elec = NULLIF(TRIM(@hydro_share_elec), ''),
    hydro_share_energy = NULLIF(TRIM(@hydro_share_energy), ''),
    low_carbon_cons_change_pct = NULLIF(TRIM(@low_carbon_cons_change_pct), ''),
    low_carbon_cons_change_twh = NULLIF(TRIM(@low_carbon_cons_change_twh), ''),
    low_carbon_consumption = NULLIF(TRIM(@low_carbon_consumption), ''),
    low_carbon_elec_per_capita = NULLIF(TRIM(@low_carbon_elec_per_capita), ''),
    low_carbon_electricity = NULLIF(TRIM(@low_carbon_electricity), ''),
    low_carbon_energy_per_capita = NULLIF(TRIM(@low_carbon_energy_per_capita), ''),
    low_carbon_share_elec = NULLIF(TRIM(@low_carbon_share_elec), ''),
    low_carbon_share_energy = NULLIF(TRIM(@low_carbon_share_energy), ''),
    net_elec_imports = NULLIF(TRIM(@net_elec_imports), ''),
    net_elec_imports_share_demand = NULLIF(TRIM(@net_elec_imports_share_demand), ''),
    nuclear_cons_change_pct = NULLIF(TRIM(@nuclear_cons_change_pct), ''),
    nuclear_cons_change_twh = NULLIF(TRIM(@nuclear_cons_change_twh), ''),
    nuclear_consumption = NULLIF(TRIM(@nuclear_consumption), ''),
    nuclear_elec_per_capita = NULLIF(TRIM(@nuclear_elec_per_capita), ''),
    nuclear_electricity = NULLIF(TRIM(@nuclear_electricity), ''),
    nuclear_energy_per_capita = NULLIF(TRIM(@nuclear_energy_per_capita), ''),
    nuclear_share_elec = NULLIF(TRIM(@nuclear_share_elec), ''),
    nuclear_share_energy = NULLIF(TRIM(@nuclear_share_energy), ''),
    oil_cons_change_pct = NULLIF(TRIM(@oil_cons_change_pct), ''),
    oil_cons_change_twh = NULLIF(TRIM(@oil_cons_change_twh), ''),
    oil_consumption = NULLIF(TRIM(@oil_consumption), ''),
    oil_elec_per_capita = NULLIF(TRIM(@oil_elec_per_capita), ''),
    oil_electricity = NULLIF(TRIM(@oil_electricity), ''),
    oil_energy_per_capita = NULLIF(TRIM(@oil_energy_per_capita), ''),
    oil_prod_change_pct = NULLIF(TRIM(@oil_prod_change_pct), ''),
    oil_prod_change_twh = NULLIF(TRIM(@oil_prod_change_twh), ''),
    oil_prod_per_capita = NULLIF(TRIM(@oil_prod_per_capita), ''),
    oil_production = NULLIF(TRIM(@oil_production), ''),
    oil_share_elec = NULLIF(TRIM(@oil_share_elec), ''),
    oil_share_energy = NULLIF(TRIM(@oil_share_energy), ''),
    other_renewable_consumption = NULLIF(TRIM(@other_renewable_consumption), ''),
    other_renewable_electricity = NULLIF(TRIM(@other_renewable_electricity), ''),
    other_renewable_exc_biofuel_electricity = NULLIF(TRIM(@other_renewable_exc_biofuel_electricity), ''),
    other_renewables_cons_change_pct = NULLIF(TRIM(@other_renewables_cons_change_pct), ''),
    other_renewables_cons_change_twh = NULLIF(TRIM(@other_renewables_cons_change_twh), ''),
    other_renewables_elec_per_capita = NULLIF(TRIM(@other_renewables_elec_per_capita), ''),
    other_renewables_elec_per_capita_exc_biofuel = NULLIF(TRIM(@other_renewables_elec_per_capita_exc_biofuel), ''),
    other_renewables_energy_per_capita = NULLIF(TRIM(@other_renewables_energy_per_capita), ''),
    other_renewables_share_elec = NULLIF(TRIM(@other_renewables_share_elec), ''),
    other_renewables_share_elec_exc_biofuel = NULLIF(TRIM(@other_renewables_share_elec_exc_biofuel), ''),
    other_renewables_share_energy = NULLIF(TRIM(@other_renewables_share_energy), ''),
    per_capita_electricity = NULLIF(TRIM(@per_capita_electricity), ''),
    primary_energy_consumption = NULLIF(TRIM(@primary_energy_consumption), ''),
    renewables_cons_change_pct = NULLIF(TRIM(@renewables_cons_change_pct), ''),
    renewables_cons_change_twh = NULLIF(TRIM(@renewables_cons_change_twh), ''),
    renewables_consumption = NULLIF(TRIM(@renewables_consumption), ''),
    renewables_elec_per_capita = NULLIF(TRIM(@renewables_elec_per_capita), ''),
    renewables_electricity = NULLIF(TRIM(@renewables_electricity), ''),
    renewables_energy_per_capita = NULLIF(TRIM(@renewables_energy_per_capita), ''),
    renewables_share_elec = NULLIF(TRIM(@renewables_share_elec), ''),
    renewables_share_energy = NULLIF(TRIM(@renewables_share_energy), ''),
    solar_cons_change_pct = NULLIF(TRIM(@solar_cons_change_pct), ''),
    solar_cons_change_twh = NULLIF(TRIM(@solar_cons_change_twh), ''),
    solar_consumption = NULLIF(TRIM(@solar_consumption), ''),
    solar_elec_per_capita = NULLIF(TRIM(@solar_elec_per_capita), ''),
    solar_electricity = NULLIF(TRIM(@solar_electricity), ''),
    solar_energy_per_capita = NULLIF(TRIM(@solar_energy_per_capita), ''),
    solar_share_elec = NULLIF(TRIM(@solar_share_elec), ''),
    solar_share_energy = NULLIF(TRIM(@solar_share_energy), ''),
    wind_cons_change_pct = NULLIF(TRIM(@wind_cons_change_pct), ''),
    wind_cons_change_twh = NULLIF(TRIM(@wind_cons_change_twh), ''),
    wind_consumption = NULLIF(TRIM(@wind_consumption), ''),
    wind_elec_per_capita = NULLIF(TRIM(@wind_elec_per_capita), ''),
    wind_electricity = NULLIF(TRIM(@wind_electricity), ''),
    wind_energy_per_capita = NULLIF(TRIM(@wind_energy_per_capita), ''),
    wind_share_elec = NULLIF(TRIM(@wind_share_elec), ''),
    wind_share_energy = NULLIF(TRIM(@wind_share_energy), '');

SELECT COUNT(*) AS total_registros FROM energy_raw;
SELECT SUM(renewables_share_elec IS NULL) AS renewables_share_nulos, SUM(solar_electricity IS NULL) AS solar_nulos, SUM(wind_electricity IS NULL) AS wind_nulos, SUM(hydro_electricity IS NULL) AS hydro_nulos, SUM(fossil_electricity IS NULL) AS fossil_nulos FROM energy_raw;

SHOW WARNINGS;

DROP TABLE IF EXISTS energy_clean;

CREATE TABLE energy_clean AS
SELECT
    TRIM(country) AS country,
    year,
    NULLIF(TRIM(iso_code), '') AS iso_code,

    population,
    gdp,

    electricity_demand,
    electricity_generation,

    renewables_electricity,
    renewables_share_elec,

    solar_electricity,
    solar_share_elec,

    wind_electricity,
    wind_share_elec,

    hydro_electricity,
    hydro_share_elec,

    fossil_electricity,
    fossil_share_elec,

    energy_per_capita,
    renewables_energy_per_capita,

    -- Variável derivada 1:
    -- diferença entre renováveis e combustíveis fósseis
    (
        renewables_share_elec - fossil_share_elec
    ) AS renewable_vs_fossil_gap,

    -- Variável derivada 2:
    -- geração renovável por habitante em kWh
    (
        renewables_electricity * 1000000000
        / NULLIF(population, 0)
    ) AS renewable_generation_per_capita_kwh

FROM energy_raw

WHERE country IS NOT NULL
  AND TRIM(country) <> ''
  AND year IS NOT NULL;
  
  SELECT COUNT(*) AS total_registros
FROM energy_clean;

SELECT *
FROM energy_clean
LIMIT 5;

SELECT
    year,
    ROUND(AVG(renewables_share_elec), 2) AS media_renovaveis,
    ROUND(AVG(solar_share_elec), 2) AS media_solar,
    ROUND(AVG(wind_share_elec), 2) AS media_eolica,
    ROUND(AVG(hydro_share_elec), 2) AS media_hidreletrica
FROM energy_clean
GROUP BY year
ORDER BY year;

SELECT
    COUNT(renewables_share_elec) AS quantidade,
    ROUND(AVG(renewables_share_elec), 2) AS media,
    ROUND(MIN(renewables_share_elec), 2) AS minimo,
    ROUND(MAX(renewables_share_elec), 2) AS maximo,
    ROUND(STDDEV(renewables_share_elec), 2) AS desvio_padrao
FROM energy_clean;

SELECT
    COUNT(solar_electricity) AS registros_solar,
    ROUND(AVG(solar_electricity), 2) AS media_solar_twh,
    ROUND(MAX(solar_electricity), 2) AS max_solar_twh,

    COUNT(wind_electricity) AS registros_eolicos,
    ROUND(AVG(wind_electricity), 2) AS media_eolica_twh,
    ROUND(MAX(wind_electricity), 2) AS max_eolica_twh,

    COUNT(hydro_electricity) AS registros_hidro,
    ROUND(AVG(hydro_electricity), 2) AS media_hidreletrica_twh,
    ROUND(MAX(hydro_electricity), 2) AS max_hidreletrica_twh
FROM energy_clean;

SELECT
    COUNT(renewables_share_elec) AS registros_renovaveis,
    COUNT(fossil_share_elec) AS registros_fosseis,

    ROUND(AVG(renewables_share_elec), 2) AS media_renovaveis,
    ROUND(AVG(fossil_share_elec), 2) AS media_fosseis,

    ROUND(
        AVG(renewable_vs_fossil_gap),
        2
    ) AS diferenca_media_pontos_percentuais

FROM energy_clean;SELECT
    year,

    COUNT(renewables_share_elec) AS registros_renovaveis,

    ROUND(AVG(renewables_share_elec), 2)
        AS media_renovaveis,

    ROUND(AVG(solar_share_elec), 2)
        AS media_solar,

    ROUND(AVG(wind_share_elec), 2)
        AS media_eolica,

    ROUND(AVG(hydro_share_elec), 2)
        AS media_hidreletrica

FROM energy_clean

WHERE renewables_share_elec IS NOT NULL

GROUP BY year
ORDER BY year;

SELECT
    country,

    ROUND(
        AVG(renewables_share_elec),
        2
    ) AS media_renovaveis,

    COUNT(renewables_share_elec)
        AS anos_disponiveis

FROM energy_clean

WHERE iso_code IS NOT NULL
  AND renewables_share_elec IS NOT NULL

GROUP BY country

HAVING COUNT(renewables_share_elec) >= 10

ORDER BY media_renovaveis DESC

LIMIT 15;

SELECT
    country,

    ROUND(AVG(renewables_share_elec), 2)
        AS media_renovaveis,

    ROUND(AVG(hydro_share_elec), 2)
        AS media_hidreletrica,

    ROUND(AVG(solar_share_elec), 2)
        AS media_solar,

    ROUND(AVG(wind_share_elec), 2)
        AS media_eolica,

    ROUND(AVG(fossil_share_elec), 2)
        AS media_fosseis

FROM energy_clean

WHERE iso_code IS NOT NULL
  AND renewables_share_elec IS NOT NULL

GROUP BY country

HAVING COUNT(renewables_share_elec) >= 10

ORDER BY media_renovaveis DESC

LIMIT 15;

SELECT
    year,

    ROUND(AVG(hydro_share_elec), 2) AS hidreletrica,

    ROUND(AVG(solar_share_elec), 2) AS solar,

    ROUND(AVG(wind_share_elec), 2) AS eolica,

    ROUND(AVG(renewables_share_elec), 2) AS renovaveis

FROM energy_clean

WHERE renewables_share_elec IS NOT NULL

GROUP BY year

ORDER BY year;

SELECT
    year,

    ROUND(renewables_share_elec, 2)
        AS renovaveis,

    ROUND(hydro_share_elec, 2)
        AS hidreletrica,

    ROUND(solar_share_elec, 2)
        AS solar,

    ROUND(wind_share_elec, 2)
        AS eolica,

    ROUND(fossil_share_elec, 2)
        AS fosseis

FROM energy_clean

WHERE country = 'Brazil'

ORDER BY year;

USE ecoenergy_analytics;

SELECT
    year,

    ROUND(
        AVG(renewables_share_elec),
        2
    ) AS media_base,

    ROUND(
        MAX(
            CASE
                WHEN country = 'Brazil'
                THEN renewables_share_elec
            END
        ),
        2
    ) AS brasil,

    ROUND(
        MAX(
            CASE
                WHEN country = 'Brazil'
                THEN renewables_share_elec
            END
        )
        -
        AVG(renewables_share_elec),
        2
    ) AS diferenca_brasil_media

FROM energy_clean

WHERE renewables_share_elec IS NOT NULL

GROUP BY year

ORDER BY year;

SELECT
    year,

    ROUND(
        AVG(
            CASE
                WHEN country <> 'Brazil'
                THEN renewables_share_elec
            END
        ),
        2
    ) AS media_demais_locais,

    ROUND(
        MAX(
            CASE
                WHEN country = 'Brazil'
                THEN renewables_share_elec
            END
        ),
        2
    ) AS brasil,

    ROUND(
        MAX(
            CASE
                WHEN country = 'Brazil'
                THEN renewables_share_elec
            END
        )
        -
        AVG(
            CASE
                WHEN country <> 'Brazil'
                THEN renewables_share_elec
            END
        ),
        2
    ) AS diferenca_brasil_media

FROM energy_clean

WHERE renewables_share_elec IS NOT NULL

GROUP BY year

ORDER BY year;

SELECT
    COUNT(*) AS quantidade_registros,

    ROUND(
        AVG(gdp),
        2
    ) AS media_gdp,

    ROUND(
        AVG(electricity_generation),
        2
    ) AS media_geracao_eletrica,

    ROUND(
        (
            SUM(
                (gdp - media_gdp_calc.media_gdp) *
                (electricity_generation - media_gdp_calc.media_geracao)
            )
            /
            NULLIF(
                SQRT(
                    SUM(
                        POW(
                            gdp - media_gdp_calc.media_gdp,
                            2
                        )
                    )
                    *
                    SUM(
                        POW(
                            electricity_generation - media_gdp_calc.media_geracao,
                            2
                        )
                    )
                ),
                0
            )
        ),
        4
    ) AS correlacao

FROM energy_clean

JOIN (
    SELECT
        AVG(gdp) AS media_gdp,
        AVG(electricity_generation) AS media_geracao
    FROM energy_clean
    WHERE gdp IS NOT NULL
      AND electricity_generation IS NOT NULL
) AS media_gdp_calc

WHERE gdp IS NOT NULL
  AND electricity_generation IS NOT NULL;
  
  SELECT
    COUNT(*) AS quantidade_registros,

    ROUND(
        AVG(population),
        0
    ) AS media_populacao,

    ROUND(
        AVG(electricity_demand),
        2
    ) AS media_demanda_eletrica,

    ROUND(
        (
            SUM(
                (population - medias.media_populacao) *
                (electricity_demand - medias.media_demanda)
            )
            /
            NULLIF(
                SQRT(
                    SUM(
                        POW(
                            population - medias.media_populacao,
                            2
                        )
                    )
                    *
                    SUM(
                        POW(
                            electricity_demand - medias.media_demanda,
                            2
                        )
                    )
                ),
                0
            )
        ),
        4
    ) AS correlacao

FROM energy_clean

JOIN (
    SELECT
        AVG(population) AS media_populacao,
        AVG(electricity_demand) AS media_demanda
    FROM energy_clean
    WHERE population IS NOT NULL
      AND electricity_demand IS NOT NULL
) AS medias

WHERE population IS NOT NULL
  AND electricity_demand IS NOT NULL;
  
  SELECT
    country,

    ROUND(
        AVG(renewable_generation_per_capita_kwh),
        2
    ) AS media_renovavel_kwh_por_habitante,

    COUNT(renewable_generation_per_capita_kwh)
        AS registros_disponiveis

FROM energy_clean

WHERE iso_code IS NOT NULL
  AND renewable_generation_per_capita_kwh IS NOT NULL

GROUP BY country

HAVING COUNT(renewable_generation_per_capita_kwh) >= 10

ORDER BY media_renovavel_kwh_por_habitante DESC

LIMIT 15;



SELECT
    CASE
        WHEN year BETWEEN 1985 AND 1999 THEN '1985-1999'
        WHEN year BETWEEN 2000 AND 2009 THEN '2000-2009'
        WHEN year BETWEEN 2010 AND 2019 THEN '2010-2019'
        WHEN year BETWEEN 2020 AND 2025 THEN '2020-2025'
    END AS periodo,

    COUNT(*) AS registros,

    ROUND(AVG(renewables_share_elec), 2)
        AS media_renovaveis,

    ROUND(AVG(hydro_share_elec), 2)
        AS media_hidreletrica,

    ROUND(AVG(solar_share_elec), 2)
        AS media_solar,

    ROUND(AVG(wind_share_elec), 2)
        AS media_eolica,

    ROUND(AVG(fossil_share_elec), 2)
        AS media_fosseis

FROM energy_clean

WHERE year BETWEEN 1985 AND 2025

GROUP BY
    CASE
        WHEN year BETWEEN 1985 AND 1999 THEN '1985-1999'
        WHEN year BETWEEN 2000 AND 2009 THEN '2000-2009'
        WHEN year BETWEEN 2010 AND 2019 THEN '2010-2019'
        WHEN year BETWEEN 2020 AND 2025 THEN '2020-2025'
    END

ORDER BY periodo;

SELECT
    year,

    ROUND(AVG(solar_share_elec), 2) AS media_solar,

    ROUND(AVG(wind_share_elec), 2) AS media_eolica,

    ROUND(AVG(solar_share_elec + wind_share_elec), 2)
        AS solar_eolica_total

FROM energy_clean

WHERE year BETWEEN 2000 AND 2025

GROUP BY year

ORDER BY year;

SELECT
    MIN(year) AS ano_inicial,
    MAX(year) AS ano_final,

    ROUND(
        MAX(
            CASE
                WHEN year = 1985
                THEN hydro_share_elec
            END
        ),
        2
    ) AS hidro_1985,

    ROUND(
        MAX(
            CASE
                WHEN year = 2025
                THEN hydro_share_elec
            END
        ),
        2
    ) AS hidro_2025,

    ROUND(
        MAX(
            CASE
                WHEN year = 1985
                THEN solar_share_elec
            END
        ),
        2
    ) AS solar_1985,

    ROUND(
        MAX(
            CASE
                WHEN year = 2025
                THEN solar_share_elec
            END
        ),
        2
    ) AS solar_2025,

    ROUND(
        MAX(
            CASE
                WHEN year = 1985
                THEN wind_share_elec
            END
        ),
        2
    ) AS eolica_1985,

    ROUND(
        MAX(
            CASE
                WHEN year = 2025
                THEN wind_share_elec
            END
        ),
        2
    ) AS eolica_2025

FROM energy_clean

WHERE country = 'Brazil'
  AND year IN (1985, 2025);
  
  SELECT
    country,

    ROUND(
        MAX(
            CASE
                WHEN year = 2000
                THEN solar_share_elec
            END
        ),
        2
    ) AS solar_2000,

    ROUND(
        MAX(
            CASE
                WHEN year = 2025
                THEN solar_share_elec
            END
        ),
        2
    ) AS solar_2025,

    ROUND(
        MAX(
            CASE
                WHEN year = 2025
                THEN solar_share_elec
            END
        )
        -
        MAX(
            CASE
                WHEN year = 2000
                THEN solar_share_elec
            END
        ),
        2
    ) AS crescimento_solar

FROM energy_clean

WHERE iso_code IS NOT NULL
  AND year IN (2000, 2025)

GROUP BY country

HAVING solar_2000 IS NOT NULL
   AND solar_2025 IS NOT NULL

ORDER BY crescimento_solar DESC

LIMIT 15;

SELECT
    country,

    ROUND(
        MAX(
            CASE
                WHEN year = 2000
                THEN wind_share_elec
            END
        ),
        2
    ) AS eolica_2000,

    ROUND(
        MAX(
            CASE
                WHEN year = 2025
                THEN wind_share_elec
            END
        ),
        2
    ) AS eolica_2025,

    ROUND(
        MAX(
            CASE
                WHEN year = 2025
                THEN wind_share_elec
            END
        )
        -
        MAX(
            CASE
                WHEN year = 2000
                THEN wind_share_elec
            END
        ),
        2
    ) AS crescimento_eolico

FROM energy_clean

WHERE iso_code IS NOT NULL
  AND year IN (2000, 2025)

GROUP BY country

HAVING eolica_2000 IS NOT NULL
   AND eolica_2025 IS NOT NULL

ORDER BY crescimento_eolico DESC

LIMIT 15;

SELECT
    country,

    ROUND(renewables_share_elec, 2)
        AS renovaveis_2025,

    ROUND(hydro_share_elec, 2)
        AS hidreletrica_2025,

    ROUND(solar_share_elec, 2)
        AS solar_2025,

    ROUND(wind_share_elec, 2)
        AS eolica_2025,

    ROUND(fossil_share_elec, 2)
        AS fosseis_2025

FROM energy_clean

WHERE year = 2025
  AND iso_code IS NOT NULL
  AND renewables_share_elec IS NOT NULL

ORDER BY 2 DESC

LIMIT 20;

USE ecoenergy_analytics;

DROP VIEW IF EXISTS vw_dashboard_kpis;

CREATE VIEW vw_dashboard_kpis AS
SELECT
    ROUND(AVG(renewables_share_elec), 2) AS media_renovaveis,
    ROUND(AVG(fossil_share_elec), 2) AS media_fosseis,
    ROUND(AVG(hydro_share_elec), 2) AS media_hidreletrica,
    ROUND(AVG(solar_share_elec), 2) AS media_solar,
    ROUND(AVG(wind_share_elec), 2) AS media_eolica
FROM energy_clean;

SELECT * 
FROM vw_dashboard_kpis;

DROP VIEW IF EXISTS vw_dashboard_temporal;

CREATE VIEW vw_dashboard_temporal AS
SELECT
    year,
    ROUND(AVG(renewables_share_elec), 2) AS renovaveis,
    ROUND(AVG(fossil_share_elec), 2) AS fosseis,
    ROUND(AVG(hydro_share_elec), 2) AS hidreletrica,
    ROUND(AVG(solar_share_elec), 2) AS solar,
    ROUND(AVG(wind_share_elec), 2) AS eolica
FROM energy_clean
WHERE year >= 1985
GROUP BY year
ORDER BY year;

SELECT *
FROM vw_dashboard_temporal;

DROP VIEW IF EXISTS vw_dashboard_paises_2025;

CREATE VIEW vw_dashboard_paises_2025 AS
SELECT
    country,
    iso_code,
    ROUND(renewables_share_elec, 2) AS renovaveis,
    ROUND(fossil_share_elec, 2) AS fosseis,
    ROUND(hydro_share_elec, 2) AS hidreletrica,
    ROUND(solar_share_elec, 2) AS solar,
    ROUND(wind_share_elec, 2) AS eolica
FROM energy_clean
WHERE year = 2025
  AND iso_code IS NOT NULL
  AND renewables_share_elec IS NOT NULL;
  
  SELECT *
FROM vw_dashboard_paises_2025
ORDER BY renovaveis DESC
LIMIT 20;

DROP VIEW IF EXISTS vw_dashboard_brasil;

CREATE VIEW vw_dashboard_brasil AS
SELECT
    year,
    ROUND(renewables_share_elec, 2) AS renovaveis,
    ROUND(fossil_share_elec, 2) AS fosseis,
    ROUND(hydro_share_elec, 2) AS hidreletrica,
    ROUND(solar_share_elec, 2) AS solar,
    ROUND(wind_share_elec, 2) AS eolica,
    ROUND(renewable_vs_fossil_gap, 2) AS diferenca_renovaveis_fosseis
FROM energy_clean
WHERE country = 'Brazil'
ORDER BY year;

SELECT *
FROM vw_dashboard_brasil;

DROP VIEW IF EXISTS vw_dashboard_fontes;

CREATE VIEW vw_dashboard_fontes AS

SELECT
    year,
    'Hidrelétrica' AS fonte,
    ROUND(AVG(hydro_share_elec), 2) AS participacao
FROM energy_clean
WHERE year >= 1985
  AND hydro_share_elec IS NOT NULL
GROUP BY year

UNION ALL

SELECT
    year,
    'Solar' AS fonte,
    ROUND(AVG(solar_share_elec), 2) AS participacao
FROM energy_clean
WHERE year >= 1985
  AND solar_share_elec IS NOT NULL
GROUP BY year

UNION ALL

SELECT
    year,
    'Eólica' AS fonte,
    ROUND(AVG(wind_share_elec), 2) AS participacao
FROM energy_clean
WHERE year >= 1985
  AND wind_share_elec IS NOT NULL
GROUP BY year

ORDER BY year, fonte;

SELECT *
FROM vw_dashboard_fontes
ORDER BY year, fonte
limit 15;

SELECT *
FROM vw_dashboard_kpis;

SELECT *
FROM vw_dashboard_temporal
ORDER BY year;

SELECT *
FROM vw_dashboard_paises_2025
ORDER BY renovaveis DESC;

SELECT *
FROM vw_dashboard_brasil
ORDER BY year;

SELECT *
FROM vw_dashboard_fontes
ORDER BY year, fonte;