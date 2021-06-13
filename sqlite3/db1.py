import sqlite3
from sqlite3 import Error


def create_connection(db_file):
    """ create a database connection to a SQLite database """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        print(sqlite3.version)
        print("conection ok")
    except Error as e:
        print(e)
    finally:
        if conn:
            conn.close()

def test():
	conn = sqlite3.connect(r"employee.db")
	cursorObj = conn.cursor()
	cursorObj.execute("INSERT INTO employee (name, number, email) VALUES('Kraus', 7300, 'HR@ss.de')")
	conn.commit()

def addDataToDatabase(name1, number1, email1):
	entity = (name1, number1, email1)
	conn = sqlite3.connect(r"employee.db")
	cursorObj = conn.cursor()
	cursorObj.execute('''INSERT INTO employee (name, number, email) VALUES(?, ?, ?)''', entity)
	conn.commit()


def run():
	while True:

		option1 = input( str('''
			Please type an option: 
			[c]onnect to the database
			[i]nsert a new value
			[t]est (inserting a value)
			[e]xit
			''') ).lower()
		if option1 == 'c':
			create_connection(r"employee.db")
		elif option1 == 'i':
			name = input( str('Please type the name: ') )
			number = input( str('Please type the number: ') )
			email = input( str('Please type the email: ') )
			addDataToDatabase(name, number, email)
		elif option1 == 't':
			test()
		elif option1 == 'e':
			break
		else:
			print("Invalid option")



if __name__ == '__main__':
	run()