# library-management-system
A frontend application for managing the resources and memberships of a university library stored in MySQL Server.

``Optimization Tasks of Assignment 8 is at the end.``

Steps to run this project
---

Installation requirements :

```
python3 -m venv env_flask
pip3 install flask
pip3 install flask-mysqldb
pip3 install pyyaml
```

MySQL Server (Workbench) should also be installed. Dump the library schema with dummy values using the following command in MySQL:

```
source dumpfile.sql;
```

One must configure the db.yaml file to connect to the MySQL Server.

```
mysql_host: 'localhost'
mysql_user: 'root'
mysql_password: '<enter your password>'
mysql_db: '<enter the name of the database which can be imported from the dump file>'
```

After cloning the repository and entering into the ```library-management-system``` folder :

```
cd flask-website
python app.py
```

Click on the URL ```http://127.0.0.1:5000``` to visit the Library Management System website.

Contents of this repository
---

- The relations were added to the database from the MySQL client command line. The schema with dummy values of our database can be found in the ```assignment8_dump.sql``` file.
- A Python script was used to add dummy data to our tables. This script can be found in the  ```insert_dummy_values.py``` file.
- The Flask website code is found inside the ```flask-website``` folder.

Snapshots of the functioning of the website
---

The functioning of the INSERT, DELETE and UPDATE queries has been shown through the following snapshots of the website. We have also shown some cases where our web app gives errors like foreign key constraints are violated, duplicate primary keys, etc.


### View Of `Users` Relation
![alt text](Snapshots/intro_1.png?raw=true)
![alt text](Snapshots/intro_2.png?raw=true)

### View Of `Users` Relation in Workbench
![alt text](Snapshots/user_wb_3.png?raw=true)

### Adding Entry in `Users` Relation
![alt text](Snapshots/user_add_4.png?raw=true)
![alt text](Snapshots/user_add_5.png?raw=true)
![alt text](Snapshots/user_add_wb_6.png?raw=true)

### Updating Entry in `Users` Relation
![alt text](Snapshots/user_update_7.png?raw=true)
![alt text](Snapshots/user_update_8.png?raw=true)
![alt text](Snapshots/user_updated_9.png?raw=true)
![alt text](Snapshots/user_updated_wb_10.png?raw=true)

### Deleting Entry in `Users` Relation
![alt text](Snapshots/user_delete_11.png?raw=true)
![alt text](Snapshots/user_deleted_12.png?raw=true)
![alt text](Snapshots/user_deleted_wb_13.png?raw=true)

### View Of `Transactions` Relation
![alt text](Snapshots/trans_16.png?raw=true)

### Adding Entry in `Transactions` Relation
![alt text](Snapshots/trans_add_17.png?raw=true)
![alt text](Snapshots/trans_added_18.png?raw=true)
![alt text](Snapshots/trans_added_wb_19.png?raw=true)

### Adding Entry in `User_Issue` Relation
![alt text](Snapshots/user_issue_add_20.png?raw=true)
![alt text](Snapshots/user_issue_added_21.png?raw=true)
![alt text](Snapshots/user_issue_added_22.png?raw=true)

### Adding Entry in `Book_Issue` Relation
![alt text](Snapshots/book_issue_add_23.png?raw=true)
![alt text](Snapshots/book_issue_added_24.png?raw=true)
![alt text](Snapshots/book_issue_added_wb_25.png?raw=true)

### Updating Entry in `Library_Systems` Relation
![alt text](Snapshots/library_systems_update_26.png?raw=true)
![alt text](Snapshots/library_systems_updated_27.png?raw=true)
![alt text](Snapshots/library_systems_updated_wb_28.png?raw=true)

### Deleting Entry in `Library_Systems` Relation
![alt text](Snapshots/system_allocations_delete_29.png?raw=true)
![alt text](Snapshots/system_allocation_deleted_30.png?raw=true)
![alt text](Snapshots/system_allocation_deleted_wb_31.png?raw=true)

### Error due to `Foreign Key` Constraint in `Users` Relation
![alt text](Snapshots/user_delete.png?raw=true)
![alt text](Snapshots/user_deleted_foreign_error.png?raw=true)

### Error due to `Duplicate Primary Key` in `Books` Relation
![alt text](Snapshots/book_add_14.png?raw=true)
![alt text](Snapshots/book_add_error_15.png?raw=true)


Tasks Assignment 8
---

## Task 1
Query 1 \
``select * from publishers where publisher_name like '%David%' or street_name like '%Scott%';``

Optimized query 1
```
select * from publishers where match(publisher_name) against ('*David*' in boolean mode)
union 
select * from publishers where match(street_name) against ('*Scott*' in boolean mode);

```
![alt text](a8_pics/q_1.png?raw=true)
![alt text](a8_pics/q_2.png?raw=true)

Query 1 \
Rows: ``1000`` \
Duration: ``0.00254800 s``

Optimized query 1 \
Rows: ``2`` (reduced) \
Duration: ``0.00053000 s`` (reduced)

If we run queries using the comparison operator ‘or’ on different columns in the where clause, there are chances that the MySQL optimizer may incorrectly choose a full table scan to retrieve a record. However, having different indices to optimize two separate queries on the two different attributes and taking the union of those results can make the query run faster. The query 1 above can run far much slower compared to optimized query 1 which uses a union operator to merge the results of 2 separate fast queries that take advantage of the indexes.

## Task 2

Query: ```SELECT * FROM users WHERE user_name LIKE “m%”;``` \
[pattern selected: x% , where x is any character from english alphabet]

Number of rows hit: ``2000``

Execution time: ``0.00189500 sec``

In the query mentioned above, we are querying a name that starts with the English alphabet ‘m’. The query is expected to return the rows from the ``users`` table having the value of attribute user_name as a string starting with ‘m’. Clearly, this can be modeled as a prefix selection problem. In our query, the prefix required is ‘m’. Therefore, we can create a prefix index on the attribute user_name using:

```CREATE INDEX user_name_ind ON users(user_name(1));```

Now, we run the query again for the same pattern. To force the use of index, we run the optimized query as:

```SELECT * FROM users USE INDEX(user_name_ind) WHERE user_name LIKE “m%”;```

Number of rows hit: ``221``

Execution time: ``0.00142900 sec``

Results:
![alt text](a8_pics/image3.png?raw=true)
![alt text](a8_pics/image20.png?raw=true)
![alt text](a8_pics/image10.png?raw=true)
![alt text](a8_pics/image23.png?raw=true)

## Task 3

Table: **Publishers** \
Column: 
- **zip_code**: Change to BIGINT \
The longest postal code used around the world is 10 digits long. So, space required to store zip_code will be 8 bytes. INT type comparisons are faster than VARCHAR as the former takes up less space than varchars. If we store zip_code as varchar(10) space required will be 11 bytes per entry.

Results: \
![alt text](a8_pics/image7.png?raw=true)
![alt text](a8_pics/image4.png?raw=true)
![alt text](a8_pics/image5.png?raw=true)

Similarly, we can only change the following column types: 

Table: **Publishers_Phone** \
Column: 
- **phone_number**: Change to BIGINT \
Phone numbers are 10 digits long. So, space required to store phone_numbers will be 8 bytes using BIGINT. INT type comparisons are faster than VARCHAR as the former takes up less space than varchars. If we store phone_number as varchar(10) space required will be 11 bytes per entry.

Table: **Faculty** \
Column: 
- **salary**: No salary will be greater than 1,67,77,215. So we can keep the salary field as MEDIUMINT.

Table: **Book_Location** \
Column: 
- **shelf_ID**: Change to TINYINT \
At most there will be 100 shelves in the library.

## Task 4

Query 1: ``SELECT * FROM transaction WHERE issue_date = "2022-09-07"``

This task was implemented on the Transaction table. Initially, the issue_date column had the data type as ``VARCHAR(20)``. \
The time taken by the query as given by the profiling functionality in MySQL is: ``0.00618500`` 

The decision to make date from varchar to date type results in decrease of execution time as the date type is inherently more structured. When searching for the date, instead of searching for every character and pattern in varchar, a date can be divided by hyphens over day, month and year. The search values over these three divisions help in faster retrieval of data.

![alt text](a8_pics/image18.png?raw=true)
![alt text](a8_pics/image17.png?raw=true)

The data type was then changed to DATE for the attribute issue_date. \
![alt text](a8_pics/image8.png?raw=true)

Time taken for the same query now reduces to 0.00364000, which is almost half of the earlier execution time. \
![alt text](a8_pics/image16.png?raw=true)

## Task 5

Initially the description of all the fee receipts in the penalties column is NULL. Therefore counting over that column returns 0.
However, when a NOT NULL description is added, count over description = 1 (i.e. the NOT NULL description is counted). Similarly, when more NOT NULL description values are added to the table, count(description) returns the count of the total NOT NULL description rows from the table.

![alt text](a8_pics/image1.png?raw=true)
![alt text](a8_pics/image19.png?raw=true)
![alt text](a8_pics/image9.png?raw=true)
![alt text](a8_pics/image6.png?raw=true)
![alt text](a8_pics/image12.png?raw=true)

## Task 6

``System not compatible to cache queries``\
Select statements like 
- Location: Getting the different books locations of the library 
- System_Allocation: Selecting all the alloted library systems
- Genres: Seeing the different genres variety for books \
and many more are some of the frequently run select statements. Caching them will reduce the the execution time significantly in the next run. If a query has been cached, the next time it is run, it will be fetched from the cache to give the output in lesser time. Also, the above three tables will be updated less frequently. So, it is better to use cached data for select queries on them as cached data gets removed if we run update/insert query on that particular table.

## Task 7

Query: To find the names of all users working in the library.

```
select u.user_name
from users as u
where u.user_ID in
(select user_ID 
from library_staff as l
where u.user_ID = l.user_ID);
```

Optimized query using joins-

```
select u.user_name
from users as u, library_staff as l
where u.user_ID  = l.user_ID;
```
![alt text](a8_pics/image11.png?raw=true)
![alt text](a8_pics/image14.png?raw=true)
![alt text](a8_pics/image13.png?raw=true)

We can observe that the first query takes ``0.12s`` however, the optimized query using the join gives the correct output in ``0.004s`` which is very less compared to the first query. 

The reason is because in the first query, for every row of the users table, the complete library_staff table is checked for a matching ID. This is a slow process as for each row the entire library_stafff table has to be fetched from the disc into memory for comparison. However, in the optimized query, first a temporary table is formed by joining the two tables, resulting in their cartesian product and just the two ID columns of both the tables are compared.

*Drawbacks of multiple joins:-*

As the number of tables increases, the cost of optimizing such complex queries increases. This is because for n joins, there are n! Possible orderings. A 2 table join can be performed in 2 ways (A join B or B join A), However, for a three table join, there are 6 possible orders and for a 10 table join there are 3,628,800 unique join orders. Thus the time required to inspect all possible query plans is much longer however the difference in actually executing those different join orders is not much.
Also, more space is needed to store the intermediate results in temporary tables.

## Task 8

Query: To find all the user_names who are part of the staff and working in the job_profile with highest salary

Nested Query:
```
select user_name 
from users 
where user_id in 
(select user_id 
from staff 
where job_profile in 
(select job_profile 
from job_salary 
where salary = 
(select max(salary) from job_salary)));
```

Optimized Query:
```
select distinct(user_name) 
from (select job_profile 
from job_salary
order by salary desc limit 1) as a 
natural join staff 
natural join users
```

![alt text](a8_pics/image21.png?raw=true)
![alt text](a8_pics/image22.png?raw=true)

We can observe that the original nested query takes ``0.00087000 sec``., however the optimized query which is written using join operations and order by, limit clauses takes ``0.00085250 sec``. which is less than the execution time for original nested query. 

The reason is clear from the number of scan rows shown in the above image. The max clause in the nested query scans all the 16 rows of job_salary, however the order by and limit clause effectively scans 1 row from the derived table which makes the query faster.

## Additional features in the website

For ``Task 1``, we have added a search functionality that takes substrings of the publisher name and the street name and returns results about all the publishers whose attributes contain those substrings.

For ``Task 2``, we have added a search functionality that takes a string and returns the details of all users whose user_name starts with the input string (i.e. searching from the prefix).

For ``Task 4``, we  added a feature where the user can enter a date, and he will be shown all the transactions where the issue date was the date that he entered.

For ``Task 7``, we have implemented a join functionality where the user can  find the names of all users working in the library in a faster manner due to our optimized query using join. 

For ``Task 7``, We have also added a new tab ``Miscellaneous Joins`` on the webpage using which we can see the output of joins of two compatible tables given the common attribute.

**Contribution**

G1: All the members had equal contribution (12.5% each out of 50%)
- 19110080: Chetan Kishore
- 19110093: Manas Mulpuri
- 19110106: Gaurav Viramgami
- 19110136: Shrreya Singh

G2: All the members had equal contribution (12.5% each out of 50%)
- 19110090: Shubh Lavti
- 19110092: Mahika Om Jaguste
- 19110127: Nipun Mahajan
- 19110128: Paras Gupta

**References**

https://www.bridge-global.com/blog/tips-to-improve-mysql-query-performance/

