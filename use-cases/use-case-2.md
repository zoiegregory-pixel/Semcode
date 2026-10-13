Use Case 2: Countries by Continent
Goal in Context  
As a policy analyst I want to view all countries in a continent organised by population size so that I can compare demographic distribution.

Scope  
Population reporting system.

Level  
Primary task.

Preconditions  
Database contains continent population data.

Success End Condition  
Report of countries in continent ordered by population.

Failed End Condition  
No report produced or invalid continent.

Primary Actor  
Policy analyst.

Trigger  
Analyst requests continent report.

Main Success Scenario

Analyst selects “Countries by Continent” report.

Analyst enters continent name.

System connects to database.

System executes query filtering by continent.

Report is displayed.

Extensions

Invalid continent → “No records found.”

Schedule  
Release 1.0.