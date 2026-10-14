Use Case 3: Top N Countries
Goal in Context  
As a researcher I want to request the top N populated countries in the world, continent, or region so that I can focus on the largest populations relevant to my study.

Scope  
Population reporting system.

Level  
Primary task.

Preconditions  
Database contains country population data. N is provided.

Success End Condition  
Report of top N countries is available.

Failed End Condition  
Invalid N or no data.

Primary Actor  
Researcher.

Trigger  
Researcher requests top N report.

Main Success Scenario

Researcher selects “Top N Countries” report.

Researcher enters N and filter (world/continent/region).

System connects to database.

System executes query with LIMIT N.

Report is displayed.

Extensions

Invalid N → prompt for valid input.

Filter not found → “No records available.”

Schedule  
Release 1.0.