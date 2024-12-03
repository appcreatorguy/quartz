#lecture
# 22 - multi-table queries
class: [[CM12004]]
topics mentioned: #databases #sql
date: 2024-11-25
teacher: [[Andy Barnes]]

## data query language
[[21 - building relational databases|last lecture]], we looked at the subset of [[SQL]] called *data definition language*, which lets us define [[database]] structure.
now we will look at *data query language*, which lets us **query**, or extract data from a DB.
### projection
we can create queries using discrete maths, using **[[projection algebra]]**:
$$\Pi_x(y)$$
this is a projection of the set of columns $x=\{\ldots\}$ from the relation $y$.
for example, $\Pi_{name}(Teacher)$ would select all the names from the teacher relation.
we can write this in [[SQL]] using the `SELECT` and `FROM` keywords:
```sql
SELECT name FROM Teacher;
```
### selection
we can filter relations using a selection (conditional) statement:
$$\sigma_x(y)$$
this is a selection from the relation $y$ where the condition(s) $x$ is/are true.
for example, $\sigma_{year\_grp=1}(Class)$ would select all classes where the year group is 1. in SQL:
```sql
SELECT *
FROM Class
WHERE year_grp=1;
```
### combining tables
when selecting data from multiple tables, we use the `JOIN` keyword. there are many different types of joins.
![[Pasted image 20241125134225.png]]
the smartest way to join two *related* tables is to use an `INNER JOIN`. this lets us join two tables where we only select the elements that satisfy a condition.
for example:
$$Class\bowtie _{Class.tid=Teacher.tid}(Teacher)$$