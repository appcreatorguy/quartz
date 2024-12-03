#lecture
# 24 - transactional SQL
class: [[CM12004]]
topics mentioned: #databases #sql 
date: 2024-11-29
teacher: [[Andy Barnes]]
## data manipulation language
+ deleting data:
```sql
DELETE FROM <tbl name> WHERE <condition>;
```
+ updating data:
```sql
UPDATE <tbl> SET <column>=<value>;
```
+ inserting data:
```sql
INSERT INTO <tbl> VALUES <set>;
```
we now have our full set of [[CRUD]] operations in [[SQL]]:
+ *C*reate - `INSERT INTO`
+ *R*ead - `SELECT`
+ *U*pdate - `UPDATE`
+ *D*elete - `DELETE FROM`
## transactions
a *[[transaction]]* is a **unit of work** for a database. it may contain multiple CRUD operations, but they all (ideally) correspond to a single action.
we do this to:
+ ensure *consistency* in the database.
+ prevent contamination between queries.
### [[ACID]]
a key principle of transactions is that they all follow the points of [[ACID]]:
+ **atomicity** - each transaction is a single unit that must succeed or fail in its entirety
+ **consistency** - the [[database]] can only change between two state, a successful [[transaction]] or no change.
+ **isolation** - transactions must work independently of each other.
+ **durability** - once committed, the result of a [[transaction]] will persist if the system fails.
### using transactions
all transactions begin with a `BEGIN TRANSACTION` statement, followed by a set of [[SQL]] statements. the transaction can then either end with a `COMMIT`, making the changes permanent, or a `ROLLBACK`, removing the changes.
### locking
locking allows us to prevent multiple transactions from trying to access the same part of a [[database]] at once, helping us to keep consistency in our database.
locks can be done at most levels:
+ database
+ table
+ row