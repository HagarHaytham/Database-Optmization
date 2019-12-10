from faker import Faker
import numpy as np

import random
import pymysql as PyMySQL

levels = ['first','second','third','fourth','fifth']
genders = ['F','M']

# generating data for student : FirstName,LastName,SSN,Mobile,Age,Gender.
# f = open("demofile3.txt", "w")
ssn = 500000
fake = Faker() 

db = PyMySQL.connect("localhost","testuser","123456","newrlm" )
cursor = db.cursor()
for i in range(ssn,ssn+500000):
    name = fake.name().split(' ')
    first_name = name[0]
    last_name = name[1]
    phone_number = random.randint(1000000000,5000000000)
    ssn += 1
    age = random.randint(25,70)
    job = fake.job()
    gender = genders[random.randint(0,1)]
    current_level = levels[random.randint(0,4)]
    sql ="INSERT INTO STUDENT (SSN,FirstName, LastName,Job,Age,Gender,Mobile,CurrentLevel) VALUES ( %s , %s ,%s ,%s , %s ,%s ,%s , %s )"
    try:
        cursor.execute(sql,(ssn,first_name,last_name,job,age,gender,phone_number,current_level,))
        db.commit()
    except:
        db.rollback()
    
    # f.write(first_name+" "+last_name+" "+str(phone_number)+" "+str(ssn)+" "+str(age)+" "+job+" "+gender+" "+current_level+"\n")
# f.close()
db.close()