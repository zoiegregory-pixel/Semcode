SELECT
    c.Continent AS Continent, -- Selects the continent name

    SUM(c.Population) AS TotalPopulation, -- Calculates the total population of the continent

    SUM(
        COALESCE(cp.CityPopulation, 0)
    ) AS PopulationLivingInCities, -- Calculates the total population living in cities

    ROUND(
        SUM(COALESCE(cp.CityPopulation, 0))
        / SUM(c.Population) * 100,
        2
    ) AS PercentageLivingInCities, -- Calculates the percentage living in cities

    SUM(c.Population)
        - SUM(COALESCE(cp.CityPopulation, 0))
        AS PopulationNotLivingInCities, -- Calculates the population not living in cities

    ROUND(
        (
            SUM(c.Population)
            - SUM(COALESCE(cp.CityPopulation, 0))
        )
        / SUM(c.Population) * 100,
        2
    ) AS PercentageNotLivingInCities -- Calculates the percentage not living in cities

FROM country c -- Uses the country table and gives it the alias c

LEFT JOIN ( -- Creates a temporary result containing city population totals

    SELECT
        CountryCode, -- Selects the country code

        SUM(Population) AS CityPopulation -- Adds all city populations for each country

    FROM city -- Uses the city table

    GROUP BY CountryCode -- Groups the cities by country

) cp -- Gives the temporary table the alias cp

    ON c.Code = cp.CountryCode -- Matches the country with its city population

GROUP BY c.Continent -- Groups all countries by continent

ORDER BY TotalPopulation DESC; -- Sorts continents from largest population to smallest