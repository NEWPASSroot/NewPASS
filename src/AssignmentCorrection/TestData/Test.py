import requests

url = 'http://127.0.0.1:5000/python'
data = {
    'path': r'D:\workspace\NewPASS\src\AssignmentCorrection\TestData\Python',
    'folderList': 'hw1;hw2;hw3;hw4;hw5;hw7;hw8;hw9'
}

score = requests.post(url, data=data)

print(score.text)
