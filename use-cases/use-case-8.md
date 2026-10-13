Use Case 8: Language Speakers
Goal in Context  
As a linguist I want to know how many people speak Chinese, English, Hindi, Spanish, and Arabic, including their percentage of the world population so that I can assess language prevalence globally.

Scope  
Population reporting system.

Level  
Primary task.

Preconditions  
Database contains language speaker data.

Success End Condition  
Language report is available.

Failed End Condition  
No report produced.

Primary Actor  
Linguist.

Trigger  
Linguist requests language report.

Main Success Scenario

Linguist selects “Language Speakers” report.

System connects to database.

System executes query to count speakers of each language.

System calculates percentages.

Report is displayed.

Extensions

Missing language data → “No records available.”

Schedule  
Release 1.0.