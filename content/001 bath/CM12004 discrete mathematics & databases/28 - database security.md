#lecture
# 28 - database security
class: [[CM12004]]
topics mentioned: #databases #security
date: 2024-12-09
teacher: [[James Davenport]]

## SQL injection
[[SQL injection]] occurs when data that has not been validated is sent to an [[interpreter]] as part of a SQL command or query. this can let an attacker trick the interpreter into executing unintended commands, or accessing unauthorised data.
common SQL queries handle some data that changes at runtime, such as 
```python
sql_query("SELECT * FROM users WHERE name = '" + login + "';")
```
this will correctly work if the value of login is passed as, for example "Manas". however, if the user were to input `Manas" OR "1"="1`, the [[SQL]] interpreter would now see:
```sql
SELECT * FROM users WHERE name = "Manas" OR "1"="1";
```
with an additional condition that is always true, and so would return all records from the `users` table.
## solutions
many [[SQL]] engines offer *parameterised queries*, where the engine offers a method to define parameters in a SQL query, which can then be specified afterwards. this is a better method, as it means that the SQL statement is parsed **before** the input is added, so injection attacks cannot work.
if this is not available, then **all data** should be sanitised before it is put into a statement, and should be treated as hostile as a default.