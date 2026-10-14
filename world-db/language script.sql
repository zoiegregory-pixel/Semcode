SELECT
    cl.Language, -- Selects the language name from the countrylanguage table

    ROUND(SUM(c.Population * cl.Percentage / 100)) AS NumberOfSpeakers, -- Calculates the estimated total number of people who speak each language

    ROUND( -- Rounds the final percentage value
        SUM(c.Population * cl.Percentage / 100) -- Calculates the total estimated number of speakers for the language
        / (SELECT SUM(Population) FROM country) -- Divides by the total population of all countries in the world database
        * 100, -- Converts the result into a percentage
        2 -- Rounds the percentage to 2 decimal places
    ) AS PercentageOfWorldPopulation -- Gives the percentage of the world population that speaks the language

FROM countrylanguage cl -- Uses the countrylanguage table and gives it the short name cl

JOIN country c -- Joins the country table and gives it the short name c
    ON cl.CountryCode = c.Code -- Matches each language record to the correct country using the country code

WHERE cl.Language IN ( -- Filters the results so only the requested languages are included
    'Chinese', -- Include Chinese
    'English', -- Include English
    'Hindi', -- Include Hindi
    'Spanish', -- Include Spanish
    'Arabic' -- Include Arabic
)

GROUP BY cl.Language -- Groups all country records together by language so totals can be calculated

ORDER BY NumberOfSpeakers DESC; -- Sorts the languages from the greatest number of speakers to the smallest