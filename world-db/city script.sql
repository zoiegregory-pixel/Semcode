SELECT
    ci.Name, -- Selects the name of the city

    c.Name AS Country, -- Selects the country name and labels the column as Country

    ci.District, -- Selects the district or region the city belongs to

    ci.Population -- Selects the population of the city

FROM city ci -- Uses the city table and gives it the shorter alias ci

JOIN country c -- Joins the country table and gives it the shorter alias c

    ON ci.CountryCode = c.Code -- Matches each city to its country using the country code

ORDER BY ci.Name; -- Sorts the cities alphabetically by city name