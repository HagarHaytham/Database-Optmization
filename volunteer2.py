from faker import Faker
import numpy as np

import random
import pymysql as PyMySQL

levels = ['first','second','third','fourth','fifth']
genders = ['F','M']


ssn = 0
fake = Faker() 
records=""
for i in range(1000000):
    name = fake.name().split(' ')
    first_name = name[0]
    last_name = name[1]
    phone_number = random.randint(1000000000,5000000000)
    ssn += 1
    age = random.randint(25,70)
    job = fake.job()
    gender = genders[random.randint(0,1)]
    records= records+str(ssn)+','+first_name+','+last_name+','+str(age)+','+job+','+str(phone_number)+','+gender+'\n'
f = open("volunteer.csv", "w")
f.write(records)
f.close()
# sql ="INSERT INTO STUDENT (SSN,FirstName, LastName,Job,Age,Gender,Mobile,CurrentLevel) VALUES ( %s , %s ,%s ,%s , %s ,%s ,%s , %s )"