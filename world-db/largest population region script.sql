SELECT
    c.Region AS Region, -- Selects the region name

    SUM(c.Population) AS TotalPopulation, -- Adds together the population of all countries in the region

    SUM(
        COALESCE(cp.CityPopulation, 0)
    ) AS PopulationLivingInCities, -- Calculates the total population living in cities

    ROUND(
        SUM(COALESCE(cp.CityPopulation, 0))
        / SUM(c.Population) * 100,
        2
    ) AS PercentageLivingInCities, -- Calculates the percentage of the region living in cities

    SUM(c.Population)
        - SUM(COALESCE(cp.CityPopulation, 0))
        AS PopulationNotLivingInCities, -- Calculates the number of people not living in cities

    ROUND(
        (
            SUM(c.Population)
            - SUM(COALESCE(cp.CityPopulation, 0))
        )
        / SUM(c.Population) * 100,
        2
    ) AS PercentageNotLivingInCities -- Calculates the percentage not living in cities

FROM country c -- Uses the country table and gives it the alias c

LEFT JOIN ( -- Creates a temporary result containing city population totals for each country

    SELECT
        CountryCode, -- Selects the country code

        SUM(Population) AS CityPopulation -- Adds together all city populations for that country

    FROM city -- Uses the city table

    GROUP BY CountryCode -- Groups the cities by country

) cp -- Gives the temporary result the alias cp

    ON c.Code = cp.CountryCode -- Matches each country to its total city population

GROUP BY c.Region -- Groups all countries together by region

ORDER BY TotalPopulation DESC; -- Sorts regions from largest population to smallest