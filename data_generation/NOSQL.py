import pymongo
import json

with open('newrlm.json', 'r') as json_file:
    data = json.load(json_file)

mydb = None

for item in data:
    if item['type'] == 'table':
        mycol = mydb[item['name']]
        mylist = item['data']
        mycol.insert_many(mylist)

    if item['type'] == 'database':
        myclient = pymongo.MongoClient("mongodb://localhost:27017/")
        mydb = myclient[item['name']]