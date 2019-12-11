# import pymysql as PyMySQL


# db = PyMySQL.connect("localhost","testuser","123456","newrlm" )
# cursor = db.cursor()

# sql = "LOAD DATA LOCAL INFILE 'volun.csv' INTO TABLE VOLUNTEER FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (SSN,FirstName,LastName,Age,Job,Mobile,Gender)"

# try:
#     print("HELLO")
#     cursor.execute(sql,)
#     print("HELLO")
#     db.commit()
#     print("HI")
# except:
#     db.rollback()
#     print("NO")

# db.close()
from faker import Faker
fake = Faker()
tim =fake.time(pattern="%H:%M:%S", end_datetime=None)
tim2 =fake.time(pattern="%H:%M:%S", end_datetime=None)
print(tim>tim2)
# tim +=1
print(tim)
print(tim) if tim>tim2 else print(tim2)
print(tim2)