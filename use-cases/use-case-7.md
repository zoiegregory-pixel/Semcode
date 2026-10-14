Use Case 7: Population Totals
Goal in Context  
As a global analyst I want to retrieve the population of the world, continent, region, country, district, or city so that I can produce accurate demographic reports.

Scope  
Population reporting system.

Level  
Primary task.

Preconditions  
Database contains population data.

Success End Condition  
Population totals are available.

Failed End Condition  
No report produced.

Primary Actor  
Global analyst.

Trigger  
Analyst requests population totals.

Main Success Scenario

Analyst selects “Population Totals” report.

Analyst enters filter (world/continent/region/country/district/city).

System connects to database.

System executes query.

Report is displayed.

Extensions

Invalid filter → “No records found.”

Schedule  
Release 1.0.