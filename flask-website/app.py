from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
import yaml
import sys

app = Flask(__name__)

# Configure DB
db = yaml.safe_load(open('db.yaml'))
# print(db)
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)

@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'POST':
        task_content = request.form['content']
        try:
            cur = mysql.connection.cursor()
            sql_query = "select * from todo"
            resultValue = cur.execute(sql_query)
            print(resultValue + 1)
            sql_query = 'insert into todo values({0}, "{1}", 0)'.format(resultValue + 1, task_content)
            print(sql_query)
            cur.execute(sql_query)
            mysql.connection.commit()
            cur.close()
            return redirect('/')
        except:
            return 'There was an issue adding the entry.'
    else:
        cur = mysql.connection.cursor()
        sql_query = "select * from todo"
        resultValue = cur.execute(sql_query)
        tasks = []
        if resultValue > 0:
            tasks = cur.fetchall()
        return render_template('index.html', tasks = tasks)

@app.route('/delete/<int:id>')
def delete(id):
    try:
            cur = mysql.connection.cursor()
            sql_query = "delete from todo where id = {0}".format(id)
            cur.execute(sql_query)
            mysql.connection.commit()
            cur.close()
            return redirect('/')
    except:
        return 'There was an issue deleting the entry.'  

@app.route('/update', methods=['GET', 'POST'])
def update():
    pk = request.form['pk']
    print(pk, file=sys.stdout)
    try:
        cur = mysql.connection.cursor()
        sql_query = "select * from todo where id = {0}".format(pk)
        cur.execute(sql_query)
        task = cur.fetchone()
    except:
        return 'There was an issue fetching the entry'

    if request.method == 'POST':
        # task_content = request.form['update_content']
        value = request.form['value']
        try:
            cur = mysql.connection.cursor()
            sql_query = 'update todo set content = "{1}" where id = {0}'.format(pk, value)
            cur.execute(sql_query)
            mysql.connection.commit()
            cur.close()
            return redirect('/')
        except:
            return 'There was an issue updating the entry.' 
    else:
        return render_template('update.html', task=task)

if __name__ == '__main__':
    app.run(debug=True)

