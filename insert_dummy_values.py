import MySQLdb

class DbStreamer:

    @staticmethod
    def get_rows(data):
        data_rows = []
        for row in data:
            data_rows.append(row)
        return data_rows


    def __init__(self, host, user, password, database):
        self.conn = MySQLdb.Connection(host=host,
                                       user=user,
                                       passwd=password,
                                       db=database,
                                       charset="utf8",
                                       use_unicode=True)
        _cursor = self.conn.cursor()
        return

    def get_connection(self):
        return self.conn

    def close_connection(self):
        self.conn.commit()
        self.conn.close()
        return
    
    def get_tables(self):
        sql = "SHOW TABLES;"
        
        _cursor = self.conn.cursor()
        _cursor.execute(sql)
        data = _cursor.fetchall()

        return data

if __name__ == "__main__":
    ## ToDO: Init the DbStreamer object
   
    db_streamer = None

    ## user: root, host: localhost
    db_streamer = DbStreamer("localhost","root","<user_password>","<database_name>")
    _cursor = db_streamer.conn.cursor()

    # Insert into user table
    sql = '''
    INSERT INTO Users
    (user_ID, user_name)
    VALUES
    (101, "Kim"),
    (102, "Bob"),
    (103, "Siya"),
    (301, "Sam"),
    (302, "Sam"),
    (401, "Gita"),
    (723, "Lily"),
    (601, "Harry"),
    (602, "Ginny"),
    (603, "Hermoine"),
    (604, "Ron"),
    (605, "Neville"),
    (123, "Snape"),
    (561, "Monica"),
    (721, "Chandler"),
    (200, "Rachel"),
    (811, "Ross"),
    (922, "Phoebe"); 
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()
    # print(list(data))

    # Insert into Users_Phone(user_ID, phone_number)

    sql = '''
    INSERT INTO Users_Phone
    (user_ID, phone_number)
    VALUES
    (101, 1234567890),
    (101, 1345678901),
    (102, 3456789012),
    (103, 4567890123),
    (301, 5678901234),
    (302, 6789012345),
    (200, 7890123456);
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Student(user_ID, programme)

    sql = '''
    INSERT INTO Student
    (user_ID, programme)
    VALUES
    (101, "BTECH"),
    (102, "MTECH"),
    (103, "PHD"),
    (922, "PHD");
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Faculty(user_ID, dept_name, salary)

    sql = '''
    INSERT INTO Faculty
    (user_ID, dept_name, salary)
    VALUES
    (811, "Palaeontology", 90000),
    (301, "CSE", 135000),
    (302, "Mechanical", 85000),
    (200, "HSS", 79000);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Staff(user_ID, job_profile)
    sql = '''
    INSERT INTO Staff
    (user_ID, job_profile)
    VALUES
    (401, "Caretaker"),
    (723, "Hostel Manager"),
    (561, "Library Manager"),
    (721, "Finance Accountant"),
    (601, "Technician"),
    (602, "Library Worker"),
    (603, "Library Entry Superviser"),
    (604, "Library Worker"),
    (605, "Watchman"),
    (123, "Library Worker");
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Job_Salary(job_profile, salary)

    sql = '''
    INSERT INTO Job_Salary
    (job_profile, salary)
    VALUES
    ("Caretaker", 56000),
    ("Hostel Manager", 70000),
    ("Library Worker", 75000),
    ("Library Entry Superviser", 35000),
    ("Library Manager", 80000),
    ("Finance Accountant", 60000),
    ("Technician", 65000),
    ("Watchman", 56000);
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Library_Staff(user_ID, lib_dept)

    sql = '''
    INSERT INTO Library_Staff
    (user_ID, lib_dept)
    VALUES
    (561, "Manager"),
    (602, "Books sequence manager"),
    (603, "Entry Superviser"),
    (604, "Front-end technician"),
    (123, "General incharge");
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Other_Staff(user_ID, working_hours)

    sql = '''
    INSERT INTO Other_Staff
    (user_ID, working_hours)
    VALUES
    (401, 5),
    (723, 6),
    (721, 4),
    (601, 4),
    (605, 5);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Library_Systems(system_ID, system_specs)

    sql = '''
    INSERT INTO Library_Systems
    (system_ID, system_specs)
    VALUES
    (1011, "OS: Windows, NVIDIA GPU"),
    (1022, "OS: LINUX, No GPU"),
    (1023, "OS: Windows, NO GPU"),
    (1024, "OS: MacOS, TPU"),
    (1035, "OS: Windows, NVIDIA GPU");
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Books(book_ID, book_name, num_pages, availability)

    sql = '''
    INSERT INTO Books
    (book_ID, book_name, num_pages, availability)
    VALUES
    (12345, "Science Marvels", 560, "True"),
    (23456, "Archaeology", 245, "False"),
    (34567, "Astro Physics", 500, "True"),
    (45678, "Panchatantra", 200, "True"),
    (56789, "Computer Organisation and Architecture", 1200, "True"),
    (67890, "Sherlock Holmes", 820, "True");
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Books_Purchase(purchase_ID, price, purchase_date)

    sql = '''
    INSERT INTO Books_Purchase
    (purchase_ID, price, purchase_date)
    VALUES
    (2, 1050, "2012-07-27"),
    (3, 200, "2014-07-12"),
    (1, 1200, "2012-06-27"),
    (4, 3560, "2012-06-27");
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()
  

    # Insert into Publishers(publisher_ID, publisher_name, street_num, street_name, city, state, zip_code, email)

    sql = '''
    INSERT INTO Publishers
    (publisher_ID, publisher_name, street_num, street_name, city, state, zip_code, email)
    VALUES
    (98, "Penguin", 234, "LBS road", "Mumbai", "Maharashtra", 400080, "penguin7k@gmail.com"),
    (34, "Cinemix", 789, "Gandhinagar road", "Gandhinagar", "Gujarat", 382355, "cinemix00@gmail.com"),
    (56, "McGrawHill", 454, "Nehru road", "Mumbai", "Maharashtra", 400180, "nehru_publishers@gmail.com");
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Publishers_Phone(publisher_ID, phone_number)
    
    sql = '''
    INSERT INTO Publishers_Phone
    (publisher_ID, phone_number)
    VALUES
    (98, 9782792345),
    (98, 9242834791),
    (34, 8911747017),
    (56, 9172124701);
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Authors(author_ID, author_name)

    sql = '''
    INSERT INTO Authors
    (author_ID, author_name)
    VALUES
    (123, "Ping"),
    (234, "Sir Arthur Conan Doyle"),
    (345, "HP & Kennesy"),
    (428, "Lola"),
    (897, "Kiman");
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Genres(genre_ID, genre_name)

    sql = '''
    INSERT INTO Genres
    (genre_ID, genre_name)
    VALUES
    (345, "Crime"),
    (145, "Course Book"),
    (678, "History"),
    (890, "Non-fiction"),
    (738, "Intriguing"),
    (589, "Fiction");
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Location(shelf_ID, shelf_section, capacity)

    sql = '''
    INSERT INTO Location
    (shelf_ID, shelf_section, capacity)
    VALUES
    (34709, "A", 780),
    (98717, "B", 184),
    (34709, "B", 780),
    (98717, "A", 185);
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Transaction(transaction_ID, issue_date, expected_return_date, actual_return_date)

    sql = '''
    INSERT INTO Transaction
    (transaction_ID, issue_date, expected_return_date, actual_return_date)
    VALUES
    (4238, "2021-07-12", "2021-07-20", "2021-07-24"),
    (4232, "2021-07-12", "2021-07-20", "2021-07-23"),
    (4473, "2021-07-11", "2021-07-24", "2021-07-20"),
    (4211, "2021-07-15", "2021-07-24", "2021-07-20"),
    (4230, "2021-07-14", "2021-07-20", "2021-07-22"),
    (4278, "2021-03-10", "2022-07-15", "2022-07-20"),
    (4898, "2022-03-03", "2022-04-05", null);
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Penalties(fee_receipt_ID, description)

    sql = '''
    INSERT INTO Penalties(fee_receipt_ID, description)
    VALUES
    (8734, "Returned Late"),
    (4398, "Returned Late"),
    (7920, "Returned Late"),
    (1084, "Returned Late");
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Purchase(book_ID, purchase_ID)

    sql = '''
    INSERT INTO Purchase(book_ID, purchase_ID)
    VALUES
    (12345, 1),
    (23456, 2),
    (34567, 2),
    (45678, 3),
    (56789, 4),
    (67890, 4);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Book_Issue(transaction_ID, book_ID)

    sql = '''
    INSERT INTO Book_Issue(transaction_ID, book_ID)
    VALUES
    (4238, 12345),
    (4232, 45678),
    (4278, 34567),
    (4898, 23456);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into User_Issue(transaction_ID, user_ID)

    sql = '''
    INSERT INTO User_Issue(transaction_ID, user_ID)
    VALUES
    (4238, 101),
    (4232, 102),
    (4278, 103),
    (4898, 200);
    '''
    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Strike(fee_receipt_ID, transaction_ID, days, fee_paid)

    sql = '''
    INSERT INTO Strike(fee_receipt_ID, transaction_ID, days, fee_paid)
    VALUES
    (8734, 4238, 4, 400),
    (4398, 4232, 3, 300),
    (7920, 4230, 2, 200),
    (1084, 4278, 5, 500);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Book_Pub(book_ID, publisher_ID)

    sql = '''
    INSERT INTO Book_Pub(book_ID, publisher_ID)
    VALUES
    (12345, 98),
    (23456, 98),
    (34567, 34),
    (45678, 56),
    (56789, 34),
    (67890, 56);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Book_Auth(book_ID, author_ID)

    sql = '''
    INSERT INTO Book_Auth(book_ID, author_ID)
    VALUES
    (12345, 123),
    (23456, 234),
    (34567, 123),
    (45678, 345),
    (56789, 428),
    (67890, 897);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Book_Genre(book_ID, genre_ID)

    sql = '''
    INSERT INTO Book_Genre(book_ID, genre_ID)
    VALUES
    (12345, 345),
    (12345, 145),
    (12345, 678),
    (23456, 890),
    (34567, 678),
    (45678, 890),
    (56789, 738),
    (67890, 589);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Book_Location(book_ID, shelf_ID, shelf_section)

    sql = '''
    INSERT INTO Book_Location(book_ID, shelf_ID, shelf_section)
    VALUES
    (12345, 34709, "A"),
    (23456, 34709, "B"),
    (34567, 98717, "A"),
    (45678, 98717, "B"),
    (56789, 34709, "A"),
    (67890, 34709, "A");
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into System_Allocation(user_ID, system_ID)

    sql = '''
    INSERT INTO System_Allocation(user_ID, system_ID)
    VALUES
    (561, 1011),
    (602, 1022),
    (603, 1023),
    (604, 1024),
    (123, 1035);
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()

    # Insert into Library_Staff_Working_Hours(user_ID, start_time, end_time)

    sql = '''
    INSERT INTO Library_Staff_Working_Hours(user_ID, start_time, end_time)
    VALUES
    (602, "09:10:10", "15:10:10"),
    (603, "07:10:10", "15:10:10"),
    (561, "15:10:10", "20:10:10"),
    (604, "07:10:10", "15:10:10"),
    (123, "15:10:10", "20:10:10");
    '''

    _cursor.execute(sql)
    db_streamer.conn.commit()
    data = _cursor.fetchall()







    


































