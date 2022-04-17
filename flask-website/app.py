from flask import Flask, render_template, render_template_string, request, redirect
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
    'Staff' : ['user_ID', 'job_profile'],
    'Job_Salary' : ['job_profile', 'salary'],
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

task_dict ={
    'Publishers' : ['publisher_ID', 'publisher_name', 'street_num', 'street_name', 'city', 'state', 'zip_code', 'email'],

}

books = ['book1', 'book2']


@app.route('/', methods=['POST', 'GET'])
def index():
    try:
        table_data = {}
        cur = mysql.connection.cursor()
        for table_name in tables_dict.keys():
            sql_query = "select * from {}".format(table_name)
            resultValue = cur.execute(sql_query)
            current_table_data = []
            if resultValue > 0:
                current_table_data = cur.fetchall()
            table_data[table_name] = list(current_table_data)
        
        task_data = {1:[], 2:[], 4:[], 5:[], 7:[]}

        if request.method == 'POST':
            
            cur = mysql.connection.cursor()
            task_num = int(request.form["task"])
            if (task_num == 1):
                publisher_name = request.form["publisher_name"]
                street_name = request.form["street_name"]
                sql_query = "select * from publishers where publisher_name like '" + publisher_name + "%' union select * from publishers where street_name like '%" + street_name + "';"
                resultValue = cur.execute(sql_query)
                current_table_data = []
                if resultValue > 0:
                    current_table_data = cur.fetchall()
                task_data[1] = list(current_table_data)
            elif (task_num == 2):
                name = request.form["name"]
                sql_query = "select * from users WHERE user_name LIKE '" + name + "%';"
                resultValue = cur.execute(sql_query)
                current_table_data = []
                if resultValue > 0:
                    current_table_data = cur.fetchall()
                task_data[2] = list(current_table_data)
            elif (task_num == 4):
                date = request.form["date"]
                sql_query = "select * from transaction WHERE issue_date = '" + date + "';"
                resultValue = cur.execute(sql_query)
                current_table_data = []
                if resultValue > 0:
                    current_table_data = cur.fetchall()
                task_data[4] = list(current_table_data)
            elif (task_num == 5):
                table_name = request.form["table_name"]
                sql_query = "select count(*) from " + table_name + ";"
                resultValue = cur.execute(sql_query)
                current_table_data = []
                if resultValue > 0:
                    current_table_data = cur.fetchall()
                task_data[5] = list(current_table_data)
            elif (task_num == 7):
                table_name = request.form["table_name"]
                sql_query = "select u.user_name from users as u, library_staff as l where u.user_ID  = l.user_ID;"
                resultValue = cur.execute(sql_query)
                current_table_data = []
                if resultValue > 0:
                    current_table_data = cur.fetchall()
                task_data[7] = list(current_table_data)

        return render_template('index.html', tables_dict = tables_dict, keys=tables_dict.keys(), table_data = table_data, task_data = task_data)
    except Exception as e:
        return 'There was an issue fetching the entry: ' + str(e)
    # print(tables_dict.keys())
    return render_template('index.html', tables_dict = tables_dict, keys=tables_dict.keys())

@app.route('/update', methods=['GET', 'POST'])
def update():
    # print("start")
    row = request.form['pk']
    name = ""
    id = ""
    col = ""
    idx = 0
    # print(row)
    for i in row:
        if idx==0:
            if i != ",":
                name += i
            else:
                idx = 1
                continue
        if idx==1:
            if i != ",":
                id += i
            else:
                idx = 2
                continue
        if idx==2:
            if i != ",":
                col += i       

    value = request.form['value']
    try:
        cur = mysql.connection.cursor()
        sql_query = 'update {2} set {3} = "{1}" where {4} = {0};'.format(id, value, name, tables_dict[name][int(col)], tables_dict[name][0])
        # print(sql_query)
        try:
            cur.execute(sql_query)
            mysql.connection.commit()
            cur.close()
            return redirect('/#' + str(name))
        except:
            # print("Error now redirect")
            # return redirect('/#' + str(name))
            return redirect(request.url)
        
        return redirect('/')
    except Exception as e:
        # print("ERROR")
        return 'There was an issue updating the entry: ' + str(e) 

@app.route('/delete/<string:table_name>', methods=['GET', 'POST'])
def delete(table_name):
    if request.method == 'GET':
        args = request.args
        field_lst = []
        for attr in tables_dict[table_name]:
            field_name = "{}_{}".format(table_name,attr)
            field_value = args[field_name]
            if (field_value == 'None' or field_value == None):
                field_value = None
            # print(field_value)
            field_lst.append([attr, field_value])
        try:
            cur = mysql.connection.cursor()
            sql_query = 'delete from {} where '.format(table_name)
            for i in range(len(field_lst) - 1):
                if (field_lst[i][1]):
                    sql_query = sql_query + field_lst[i][0] + '=' + '"' + field_lst[i][1] + '"' + ' and '
            if (field_lst[-1][1]):
                sql_query = sql_query + field_lst[-1][0] + '=' + '"' + field_lst[-1][1] + '";'
            elif (len(sql_query) > 4):
                sql_query = sql_query[:-5]
            cur.execute(sql_query)
            mysql.connection.commit()
            cur.close()
            return redirect('/#' + str(table_name))
        except Exception as e:
            return 'There was an issue adding the entry:' + str(e)
    return redirect('/#' + str(table_name))

@app.route('/add/<string:table_name>', methods=['GET', 'POST'])
def add(table_name):
    if request.method == 'POST':
        field_lst = []
        for attr in tables_dict[table_name]:
            field_name = "{}_{}".format(table_name,attr)
            field_value = request.form[field_name]
            if field_value == '' or str(field_value).upper() == 'NULL':
                field_value = None
            # print(field_value)
            field_lst.append(field_value)
        try:
            cur = mysql.connection.cursor()
            sql_query = 'insert into {} values('.format(table_name)
            for field in field_lst[:-1]:
                if (field):
                    sql_query = sql_query + '"' + str(field) + '",'
                else:
                    sql_query = sql_query + 'NULL,'
            if (field_lst[-1]):
                sql_query = sql_query + '"' + str(field_lst[-1]) + '");'
            else:
                sql_query = sql_query + 'NULL);'
            print(sql_query)
            cur.execute(sql_query)
            mysql.connection.commit()
            cur.close()
            return redirect('/#' + str(table_name))
        except Exception as e:
            return 'There was an issue adding the entry: ' + str(e)
    return redirect('/#' + str(table_name))


if __name__ == '__main__':
    app.run(debug=True)