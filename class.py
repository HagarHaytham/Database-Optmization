from faker import Faker
import numpy as np

import random
import pymysql as PyMySQL

levels = ['first','second','third','fourth','fifth']
subjects =['arabic','religon','english','math','science']

fake = Faker() 

db = PyMySQL.connect("localhost","testuser","123456","newrlm" )
cursor = db.cursor()

volid = 0
ssn = 1

sqlclass ="INSERT INTO CLASS (EndDate,Teacher, Level,Subject,Code,StartDate,classDay,classTime) VALUES ( %s , %s ,%s ,%s , %s ,%s ,%s , %s )"
sqltimvol = "INSERT INTO TIMEVOLUNTEER (VolunteerID,Day,From,To) VALUES ( %s , %s ,%s ,%s )"
sqllesson = "INSERT INTO LESSON(LessonDate,ClassID,VolunteerID)  VALUES ( %s , %s ,%s)"
sqltimst = "INSERT INTO TIMESTUDENT (StudentID,Day,From,To ) VALUES ( %s , %s ,%s ,%s )"
sqlstudclass = "INSERT INTO STUDENTCLASS (StudentID,ClassID) VALUES (%s, %s)"
sqlstlvl = "INSERT INtO STUDENTLEVELS (StudentID,StartDate,EndDate,Level,Grade) VALUES(%s , %s ,%s ,%s ,%s)"
sqlstudlesson = "INSERT INTO STUDENTLESSON (StudentID,LessonDate,ClassID,Attended) VALUES ( %s , %s ,%s ,%s)"
for i in range(1):
    start = fake.date_between(start_date="-3y", end_date="-2y")
    end = fake.date_between(start_date="-1y", end_date="today")
    volid += 1
    code = volid
    subject = subjects[random.randint(0,4)]
    idx = random.randint(0,4)
    level = levels[idx]
    day = random.randint(1,7)
    tim =fake.time(pattern="%H:%M:%S", end_datetime=None)
    tim2 =fake.time(pattern="%H:%M:%S", end_datetime=None)
    frm =tim if tim<tim2 else tim2
    to =tim if tim>tim2 else tim2
    try:
        cursor.execute(sqlclass,(end,volid,level,subject,code,start,day,frm,))
        db.commit()
        print("1")
        print(volid,day,frm,to)
        cursor.execute(sqltimvol,(volid,day,frm,to,))
        db.commit()
        print("2")
        datelesson = fake.date_between(start_date="-2y", end_date="-1y")
        cursor.execute(sqllesson,(datelesson,code,volid,))
        db.commit()
        print("3")
        for j in range(2): # students in class
            cursor.execute(sqltimst,(ssn+j,day,frm,to,))
            db.commit()
            print("4")
            cursor.execute(sqlstudclass,(ssn+j,code,))
            db.commit()
            db.commit()
            for k in range(idx):
                start2 = fake.date_between(start_date="-5y", end_date="-4y")
                end2 = fake.date_between(start_date="-4y", end_date="-3y")
                grade = random.randint(60,99)
                cursor.execute(sqlstlvl,(ssn+j,start2,end2,level,grade,))
                db.commit()
                cursor.execute(sqlstudlesson,(ssn+j,datelesson,code,1,))
                db.commit()
        ssn +=20
    except:
        db.rollback()
        print("error")

db.close()