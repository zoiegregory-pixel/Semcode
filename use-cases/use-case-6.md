Use Case 6: Population Breakdown
Goal in Context  
As a statistician I want to calculate the population living in cities versus not living in cities for each continent, region, and country so that I can measure urbanisation levels.

Scope  
Population reporting system.

Level  
Primary task.

Preconditions  
Database contains city and non‑city population data.

Success End Condition  
Population breakdown report is available.

Failed End Condition  
No report produced.

Primary Actor  
Statistician.

Trigger  
Statistician requests population breakdown.

Main Success Scenario

Statistician selects “Population Breakdown” report.

System connects to database.

System executes queries for totals, city population, non‑city population.

System calculates percentages.

Report is displayed.

Extensions

Missing data → “Incomplete records.”

Schedule  
Release 1.0.