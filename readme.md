# PostgreSQL ![](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

--

## 1.What is PostgreSQL?

PostgreSQL is a RDBMS (Relational Database Management System). Which is  open-source, support complex data types such as array, json, XML etc also supports cross platform like linux, windows, macOs. PostgreSQL provide a mechanism that allows developers to extend it's functionality by creating custom data types, functions, trigger events and many more.

## 2.What is the purpose of a database schema in PostgreSQL?
In PostgreSQL, schema is like a container which can contain tables, views, functions, indexes etc. We can create different schemas in PostgreSQL which is easier to manage and maintain the database. Different schemas can have same name tables without confilct and different access control for different schemas. Schemas can be created for different versions. In PostgreSQL, by default every database has public schema.

## 3.Explain the primary key and foreign key concepts in PostgreSQL.

- **Primary Key:** Primary key is a column or set of columns to identify/find a specific data uniquely from a table.

- **Foreign Key:** Foreign key is a column or set of columns of a table which is primary key of another table to create relationship with that two tables.

In RDBMS, establishe the relationships between two tables using those two keys. The foreign key, present in one table, references the primary key of another table.

## 4.What is the difference between the VARCHAR and CHAR data types?

- **VARCHAR:** Variable length character data type.

- **CHAR:** Fixed length character data type.

So, VARCHAR is allow us to store less length string wheres CHAR will fill spaces with remaining length of character. VARCHAR is faster than CHAR because it will store only the length of the string. 

## 5.Explain the purpose of the WHERE clause in a SELECT statement.

The WHERE clause is used for filtering rows. If we use SELECT query without WHERE clause then it will return every rows of a table, but if we use WHERE clause with some conditions then it will return those rows which is fulfiled by the condition. 


## 6.What are the LIMIT and OFFSET clauses used for?

- **LIMIT:** LIMIT clause used for return limited number of rows from the result table. LIMIT 5 will return only first 5 rows.

- **OFFSET:** OFFSET clause used for to skip a specified number of rows from the beginning of the result table. OFFSET 5 will skip first 5 rows.

## 7.How can you perform data modification using UPDATE statements?

Syntax of UPDATE statement:

```sql
  UPDATE table_name
  SET column_name = updated_value
  WHERE condition;
```

For UPDATE statements, condition is very important because if there is no condition/specification then every/multile rows will be updated.


## 8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN operation is used to merge relational tables (relation with FK) for retrieving data. For example, if two table create relation with a FK, then JOIN operation will return a big merge table whaich has every columns of the tables.

In PostgreSQL, There are different types of JOIN operation such as INNER/LEFT/RIGHT/CROSS/FULL/NATURAL joins.

- **INNER JOIN:** Returns only those rows which is fulfilled the join condition.

- **LEFT JOIN:** Returns all rows from left table, if there is any condition not match then fill NULL into right table's columns of that rows.

- **RIGHT JOIN:** Returns all rows from right table, if there is any condition not match then fill NULL into left table's columns of that rows.

- **CROSS JOIN:** Combines each rows of first table with every rows of second table. If first table contains 3 rows and second table contains 5 rows then output table will be 3 \* 5 = 15 rows.

- **FULL JOIN:** Returns every row from left and right table but filled with NULL for every column of that table (left/right) which does not match the condition.

- **NATURAL JOIN:** Joins two tables based on column with same name, type and same value.

## 9.Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY clause is used for grouping table rows based on one/multiple columns value. For example, if a column contains few values and we want to group the rows based on that column then it will create different groups based on same values of that column.

Aggregation functions like count/sum/max etc. are applicable for only group of rows and they generate single value for every groups. If aggregation function is used without GROUP BY clause then it will create entire table as a single group.

## 10.How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?


```sql
  SELECT count(*), sum(column_name), avg(column_name)
  FROM table_name;
```

Each aggregate functions calculate single value for every group. If there is no group is specify then they assume entire table as a single group.

```sql
  SELECT count(*), sum(column_name), avg(column_name)
  FROM table_name
  GROUP BY column_name;
```

Now for every groups, COUNT, SUM, and AVG will be calculated. Sum will be adding every rows of a group with specified column and same as avg, but count will be count every row if any specified column of the row is not NULL. To avoid NULL issue in count then we can use count(\*) which is allow to count that row if any of column is not NULL.

## 11.What is the purpose of an index in PostgreSQL, and how does it optimize query performance?

Index in PostgreSQL is an optimazation technique for faster data finding/searching. Without indexing, data searching starts from one to end and it takes more time based on table size, But index helps to find data without checking everyone and it saves time.

In PostgreSQL, there are several ways to apply indexing:

- Hash table
- B++ tree

They are different data structure with different technique to aplly indexing. Hash table aplly hash algorithm which is create different blocks based on data. Every blocks start with a significant data which helps to understand which datas can be found that block. This machanism is helps to find the data as fast and compared to less checking.