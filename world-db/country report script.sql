SELECT
    c.Code, -- Selects the country's code

    c.Name, -- Selects the country's name

    c.Continent, -- Selects the continent the country belongs to

    c.Region, -- Selects the region the country belongs to

    c.Population, -- Selects the total population of the country

    ci.Name AS Capital -- Selects the capital city's name and labels the column as Capital

FROM country c -- Uses the country table and gives it the shorter alias c

LEFT JOIN city ci -- Joins the city table and gives it the shorter alias ci

    ON c.Capital = ci.ID -- Matches the country's Capital field with the ID of the correct city

ORDER BY c.Name; -- Sorts the countries alphabetically by country name