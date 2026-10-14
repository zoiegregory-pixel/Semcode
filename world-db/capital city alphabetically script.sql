SELECT
    ci.Name, -- Selects the name of the capital city

    c.Name AS Country, -- Selects the country name and labels the column as Country

    ci.Population -- Selects the population of the capital city

FROM country c -- Uses the country table and gives it the shorter alias c

JOIN city ci -- Joins the city table and gives it the shorter alias ci

    ON c.Capital = ci.ID -- Matches each country's Capital value to the correct city ID

ORDER BY ci.Name; -- Sorts the capital cities alphabetically by city name