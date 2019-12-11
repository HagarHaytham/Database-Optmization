#code,level,start_data,end_date,subject,class_time,class_day.

from faker import Faker
import numpy as np

import random


subjects = ['arabic','english','math']


# generating data for student : FirstName,LastName,SSN,Mobile,Age,Gender.
f = open("demofile3.txt", "w")
tmp_code  = 1
fake = Faker() 

#db = PyMySQL.connect("localhost","testuser","123456","newrlm" )
#cursor = db.cursor()
for i in range(1,50000):
    subject = subjects[random.randint(0,2)]
    code = tmp_code
    tmp_code += 1
    start_date = fake.date(pattern="%Y-%m-%d", end_datetime=None)
    end_date = fake.date(pattern="%Y-%m-%d", end_datetime=None)
    class_time = fake.time(pattern="%H:%M:%S", end_datetime=None)
    class_day = random.randint(1,7)
    level = random.randint(1,5)

    f.write(str(code)+" "+str(level)+" "+start_date+" "+end_date+" "+class_time+" "+str(class_day)+" "+str(level)+"\n")
    # f.write(first_name+" "+last_name+" "+str(phone_number)+" "+str(ssn)+" "+str(age)+" "+job+" "+gender+" "+current_level+"\n")
f.close()
#db.close()