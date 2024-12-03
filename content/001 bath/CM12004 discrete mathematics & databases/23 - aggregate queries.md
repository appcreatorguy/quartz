#lecture
# 23 - aggregate queries
class: [[CM12004]]
topics mentioned: #sql #databases 
date: 2024-11-27
teacher: [[Andy Barnes]]
## data query language
### aggregate functions
sometimes when querying a [[database]] using [[SQL]], we don't just want the data, but instead want to perform a [[function]] on it.
one option is for the client to query the data and then perform the function client-side. however, this could require a large volume of data being sent to the client, and so it might be more useful to perform this server-side.
[[SQL]] provides a set of [[aggregation functions]] to make these common functions easier to perform:
+ `COUNT()`
+ `MIN()`
+ `MAX()`
+ `AVG()`
+ `SUM()`
for example, to get a count of all the student IDs `sid` linked to a course code `mcode`, we can use the following query:
```sql
SELECT mcode, COUNT(sid)
FROM reg
GROUP BY (mcode)
```
>[!WARNING] warning
>notice here how we have used the `GROUP BY` keyword. this is to prevent duplicates from appearing, as by default, the query would return a duplicate record if there were multiple records with the same course code (if multiple students are on the same course).
### sub queries
often, we want to nest [[SQL]] queries. this is useful as it lets us break down larger queries into smaller, more readable chunks. we can do this by placing another query, nested in brackets wherever we would normally use a value. for example:
```sql
SELECT * FROM Busses AS a
INNER JOIN (
	SELECT * FROM Busses
	WHERE dest=‘UOB’
	AND arr_time<=1200
) AS b
ON a.dest=b.origin
WHERE a.origin=‘TWR’
AND a.arr_time < b.dep_time;
```
selects all busses from `TWR` and all busses that are heading from the destination of those busses to `UOB` and will arrive before 12:00. this lets us find the best route to take to get to `UOB` from `TWR` to arrive on time. we also add an additional condition to make sure bus `a` arrives before bus `b` departs.