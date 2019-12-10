from faker import Faker
import numpy as np

import random
import pymysql as PyMySQL

kinds =['money','food','clothes','supplies']
ssn = 0
fake = Faker() 

db = PyMySQL.connect("localhost","testuser","123456","newrlm" )
cursor = db.cursor()
for i in range(50000):
    date = fake.date_between(start_date="-4y", end_date="today")
    ssn = random.randint(1,1000000)
   
    kind = kinds[random.randint(0,3)]
    NumberOfPieces = random.randint(1,10)
    Recieved = 1
    sql ="INSERT INTO Help (Kind, NumberOfPieces,DateRecieved,Recieved) VALUES ( %s , %s ,%s ,%s )"
    
    sql2 = "INSERT INTO HELPRECEIVED (StudntID,Helpkind, HelpDate) VALUES ( %s , %s ,%s)"
    try:
        cursor.execute(sql,(kind,NumberOfPieces,date,Recieved,))
        db.commit()
        
        cursor.execute(sql2,(ssn,kind,date,))
        db.commit()
    except:
        db.rollback()

db.close()