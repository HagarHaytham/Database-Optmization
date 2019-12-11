from faker import Faker
import numpy as np

import random
import pymysql as PyMySQL

genders = ['F','M']


ssn = 0
fake = Faker() 
# records=""
db = PyMySQL.connect("localhost","testuser","123456","newrlm" )
cursor = db.cursor()
for i in range(100000):
    name = fake.name().split(' ')
    first_name = name[0]
    last_name = name[1]
    phone_number = random.randint(1000000000,5000000000)
    ssn += 1
    age = random.randint(20,49)
    job = fake.job()
    gender = genders[random.randint(0,1)]
    sql ="INSERT INTO VOLUNTEER (SSN,FirstName,LastName,Age,Job,Mobile,Gender) VALUES ( %s , %s ,%s ,%s , %s ,%s ,%s )"
    try:
        cursor.execute(sql,(ssn,first_name,last_name,age,job,phone_number,gender,))
        db.commit()
        print(i)
    except:
        db.rollback()
db.close()