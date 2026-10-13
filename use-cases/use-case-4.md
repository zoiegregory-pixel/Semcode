Use Case 4: Cities by Country/District
Goal in Context  
As a city planner I want to view all cities in a country or district organised by population size so that I can understand urban density.

Scope  
Population reporting system.

Level  
Primary task.

Preconditions  
Database contains city population data.

Success End Condition  
Report of cities ordered by population.

Failed End Condition  
No report produced or invalid input.

Primary Actor  
City planner.

Trigger  
Planner requests city report.

Main Success Scenario

Planner selects “Cities by Country/District” report.

Planner enters country/district name.

System connects to database.

System executes query filtering by country/district.

Report is displayed.

Extensions

Invalid input → “No records found.”

Schedule  
Release 1.0.