import json
import csv

print('START')

with open('./refined/sad.json', 'r') as f:
    sad = json.load(f)
    columns = list(sad[0].keys())
    index = columns.index('id')
    columns[0], columns[index] = columns[index], columns[0]
    print(columns)

with open('./refined/love.json', 'r') as f:
    love = json.load(f)

with open('./refined/happy.json', 'r') as f:
    happy = json.load(f)

with open('./refined/optimistic.json', 'r') as f:
    optimistic = json.load(f)

with open('./dataset.csv', 'w') as f:
    print('CSV START')
    writer = csv.DictWriter(f, fieldnames=columns)
    writer.writeheader()
    for item in sad:
        if item:
            writer.writerow(item)
    for item in happy:
        if item:
            writer.writerow(item)
    for item in love:
        if item:
            writer.writerow(item)
    for item in optimistic:
        if item:
            writer.writerow(item)

print('FINISH')