Use Case 1: Countries by Population
Goal in Context  
As a researcher I want to view all countries in the world organised by population size so that I can identify the most and least populated nations.

Scope  
Population reporting system.

Level  
Primary task.

Preconditions  
Database contains country population data.

Success End Condition  
Report of all countries ordered by population is available.

Failed End Condition  
No report produced or query fails.

Primary Actor  
Researcher.

Trigger  
Researcher requests country population report.

Main Success Scenario

Researcher selects “Countries by Population” report.

System connects to database.

System executes query to retrieve all countries ordered by population.

System formats results into report (Code, Name, Continent, Region, Population, Capital).

Report is displayed.

Extensions

Database connection fails → error message.

No data returned → “No records available.”

Schedule  
Release 1.0.