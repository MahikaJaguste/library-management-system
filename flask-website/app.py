from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
import yaml

app = Flask(__name__)

# Configure DB
db = yaml.safe_load(open('db.yaml'))
# print(db)
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)

tables_dict = {
    'Users' : ['user_id', 'user_name'],
    'Users_Phone' : ['user_id', 'phone_number'],
    'Student' : ['user_ID', 'programme'],
    'Faculty' : ['user_ID', 'dept_name', 'salary'],
    'Staff' : ['user_ID', 'job_profile', 'salary'],
    'Library_Staff' : ['user_ID', 'lib_dept'],
    'Other_Staff' : ['user_ID', 'working_hours'],
    'Library_Systems' : ['system_ID', 'system_specs'],
    'Books' : ['book_ID', 'book_name', 'num_pages', 'availability'],
    'Books_Purchase' : ['purchase_ID', 'price', 'purchase_date'],
    'Publishers' : ['publisher_ID', 'publisher_name', 'street_num', 'street_name', 'city', 'state', 'zip_code', 'email'],
    'Publishers_Phone' : ['publisher_ID', 'phone_number'],
    'Authors' : ['author_ID', 'author_name'],
    'Genres' : ['genre_ID', 'genre_name'],
    'Location' : ['shelf_ID', 'shelf_section', 'capacity'],
    'Transaction' : ['transaction_ID', 'issue_date', 'expected_return_date', 'actual_return_date'],
    'Penalties' : ['fee_receipt_ID', 'description'],
    'Purchase' : ['book_ID', 'purchase_ID'],
    'Book_Issue' : ['transaction_ID', 'book_ID'],
    'User_Issue' : ['transaction_ID', 'user_ID'],
    'Strike' : ['fee_receipt_ID', 'transaction_ID', 'days', 'fee_paid'],
    'Book_Pub' : ['book_ID', 'publisher_ID'],
    'Book_Auth' : ['book_ID', 'author_ID'],
    'Book_Genre' : ['book_ID', 'genre_ID'],
    'Book_Location' : ['book_ID', 'shelf_ID', 'shelf_section'],
    'System_Allocation' : ['user_ID', 'system_ID'],
    'Library_Staff_Working_Hours' : ['user_ID', 'start_time', 'end_time']
}

books = ['book1', 'book2']


@app.route('/', methods=['POST', 'GET'])
def index():
    print(tables_dict)
    return render_template('index.html', tables_dict = tables_dict, books= books)

# ------------------------------------------------------------
# @app.route('/', methods=['POST', 'GET'])
# def index():
#     if request.method == 'POST':
#         task_content = request.form['content']
#         try:
#             cur = mysql.connection.cursor()
#             sql_query = "select * from todo"
#             resultValue = cur.execute(sql_query)
#             print(resultValue + 1)
#             sql_query = 'insert into todo values({0}, "{1}", 0)'.format(resultValue + 1, task_content)
#             print(sql_query)
#             cur.execute(sql_query)
#             mysql.connection.commit()
#             cur.close()
#             return redirect('/')
#         except:
#             return 'There was an issue adding the entry.'
#     else:
#         cur = mysql.connection.cursor()
#         sql_query = "select * from todo"
#         resultValue = cur.execute(sql_query)
#         tasks = []
#         if resultValue > 0:
#             tasks = cur.fetchall()
#         return render_template('index.html', tasks = tasks)

# @app.route('/delete/<int:id>')
# def delete(id):
#     try:
#             cur = mysql.connection.cursor()
#             sql_query = "delete from todo where id = {0}".format(id)
#             cur.execute(sql_query)
#             mysql.connection.commit()
#             cur.close()
#             return redirect('/')
#     except:
#         return 'There was an issue deleting the entry.'  

# @app.route('/update/<int:id>', methods=['GET', 'POST'])
# def update(id):
#     try:
#         cur = mysql.connection.cursor()
#         sql_query = "select * from todo where id = {0}".format(id)
#         cur.execute(sql_query)
#         task = cur.fetchone()
#     except:
#         return 'There was an issue fetching the entry'

#     if request.method == 'POST':
#         task_content = request.form['update_content']
#         try:
#             cur = mysql.connection.cursor()
#             sql_query = 'update todo set content = "{1}" where id = {0}'.format(id, task_content)
#             cur.execute(sql_query)
#             mysql.connection.commit()
#             cur.close()
#             return redirect('/')
#         except:
#             return 'There was an issue updating the entry.' 
#     else:
#         return render_template('update.html', task=task)

if __name__ == '__main__':
    app.run(debug=True)