# Internal-SQL-Service
Intersystems service that can be used to query an internal SQL table to send a snapshot downstream

## Settings 
Dialect - As per Internal SQL 
SelectMode- As per Internal SQL view 
Parameters- NOT YET IMPLEMENTED 
ForwardComponentName- item to run the snapshot sent 

## Implementation
Add class to your your environemnt 
![image](https://github.com/Sparkei/Internal-SQL-Service/assets/72390562/2ec37900-e7b9-41e8-b4ab-5d0b57d5f2d4)
Set up system default setting 
![image](https://github.com/Sparkei/Internal-SQL-Service/assets/72390562/a63afd7c-8372-49c4-9bbe-457fba0c2afe)
Set forward component name

## Working with the result set
See code example InternalSQLSampleOperation.cls in example class for help in using - formats result set in HTML table
