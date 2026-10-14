SELECT
    c.Name AS Country, -- Selects the country name and labels the column as Country

    c.Population AS TotalPopulation, -- Selects the total population of the country

    COALESCE(cp.CityPopulation, 0) -- Uses the country's total city population, or 0 if no city data exists
        AS PopulationLivingInCities, -- Labels the result as the number of people living in cities

    ROUND( -- Rounds the calculated percentage
        COALESCE(cp.CityPopulation, 0) -- Gets the total population living in cities
        / c.Population * 100, -- Divides city population by total country population and converts it to a percentage
        2 -- Rounds the percentage to 2 decimal places
    ) AS PercentageLivingInCities, -- Names the calculated column PercentageLivingInCities

    c.Population -- Gets the total population of the country
        - COALESCE(cp.CityPopulation, 0) -- Subtracts the population living in cities
        AS PopulationNotLivingInCities, -- Gives the number of people not living in cities

    ROUND( -- Rounds the calculated percentage
        (
            c.Population -- Gets the total population of the country
            - COALESCE(cp.CityPopulation, 0) -- Subtracts the population living in cities
        )
        / c.Population * 100, -- Divides the non-city population by the total population and converts it to a percentage
        2 -- Rounds the percentage to 2 decimal places
    ) AS PercentageNotLivingInCities -- Names the calculated column PercentageNotLivingInCities

FROM country c -- Uses the country table and gives it the shorter alias c

LEFT JOIN ( -- Joins the country table to a temporary result containing total city population for each country

    SELECT
        CountryCode, -- Selects the country code from the city table

        SUM(Population) AS CityPopulation -- Adds together the population of all cities within each country

    FROM city -- Uses the city table

    GROUP BY CountryCode -- Groups all cities by country code so each country has one total city population

) cp -- Gives the temporary result the alias cp

    ON c.Code = cp.CountryCode -- Matches each country to its total city population using the country code

WHERE c.Population > 0 -- Removes countries or territories with a population of 0 to avoid division by zero

ORDER BY c.Population DESC; -- Sorts countries from largest total population to smallest