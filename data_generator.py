from faker import Faker
import numpy as np

import random
levels = ['first','second','third','fourth','fifth']
genders = ['F','M']
# for x in range(10):
#   print(random.randint(100000000,500000000))

# generating data for student : FirstName,LastName,SSN,Mobile,Age,Gender.
f = open("demofile3.txt", "w")
tmp_ssn = 1
fake = Faker() 
for i in range(1000000):
    name = fake.name().split(' ')
    first_name = name[0]
    last_name = name[1]
    phone_number = random.randint(1000000000,5000000000)
    ssn = tmp_ssn
    age = random.randint(25,70)
    job = fake.job()
    gender = genders[random.randint(0,1)]
    current_level = levels[random.randint(0,4)]
    
    f.write(first_name+" "+last_name+" "+str(phone_number)+" "+str(ssn)+" "+str(age)+" "+job+" "+gender+" "+current_level+"\n")
    tmp_ssn += 1
f.close()

