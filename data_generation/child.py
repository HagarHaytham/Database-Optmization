from faker import Faker
import numpy as np

import random
import pymysql as PyMySQL

genders = ['F','M']

ssn = 0
fake = Faker() 
id=0
db = PyMySQL.connect("localhost","testuser","123456","newrlm" )
cursor = db.cursor()
for i in range(50000):
    ssn += 1
    for j in range(2):
        id+=1
        age = random.randint(1,18)
        gender = genders[random.randint(0,1)]
        sql ="INSERT INTO CHILD (StudentID,Gender, Age,ID) VALUES ( %s , %s ,%s ,%s )"
        try:
            cursor.execute(sql,(ssn,gender,age,id,))
            db.commit()
        except:
            db.rollback()
db.close()