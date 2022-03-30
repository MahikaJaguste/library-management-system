# library-management-system
A frontend application for managing the resources and memberships of a university library stored in MySQL Server.

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

- The relations were added to the database from the MySQL client command line. The schema with dummy values of our database can be found in the ```dumpfile.sql``` file.
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

