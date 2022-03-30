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

![alt text](Snapshots/intro_1.png?raw=true)
