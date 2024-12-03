#lecture
# 25 - big data and noSQL data models
class: [[CM12004]]
topics mentioned: #big_data #nosql
date: 2024-12-02
teacher: [[Andy Barnes]]

## big data
in the modern world, nearly every sector is driven by data, and this leads us to the four challenges of *big data*:
+ **volume** - increasingly large datasets (scientific observations)
+ **variety** - types of data being stores (virtual drives)
+ **velocity** - rate of data change and creation (social media)
+ **veracity** - reliability and integrity of the data (medical records)
## non-relational models 
to solve the challenges of big data, [[non-relational database]]s are used.
there are four types of non-relational data models:
+ wide column (or big table) databases
+ key-value databases 
+ graph databases 
+ document databases 
### key value stores
stores data in *key and value* pairs, akin to a dictionary. it is very good for small, volatile and fast-changing data. examples include:
+ online web session tracking
+ online gaming
### wide column 
stores data **without a *schema***, and in *a single table*. each row is flexible, and can hold different attributes.
this makes queries very fast, as there are no relations to compute.
it is very good for fast, high velocity data, with high volumes.
### graph stores 
treat data like a [[graph]], with edges and nodes, where edges are [[relation]]s between two nodes. each node and edge can contain information. they are commonly used in complex network analysis, where attributes are simple, and data is quite small.
![[g2512.svg|500]]
### document stores 
in a document store, every [[entity]] is considered a document. instead of using a tabular format, a [[JSON]] style is used:
```json
{
	cid: 0,
	name: 'Herons',
	year_grp: 1,
	tid: 0,
},
```
unlike the relational model, this allows for increased *variety* through a flexible schema, and allows data to be **embedded inside** entities, instead of related to them.
this allows for a much higher query speed; however, this creates duplication, and a lack of consistency.