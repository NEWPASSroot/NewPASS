from AssignmentCorrection import app
from flask import request, jsonify
from AssignmentCorrection.src.PythonCorrection import PythonCorrection
import pprint

class API():
    def python(self, path, folderList):
        correction = PythonCorrection(path, folderList)
        return jsonify(correction.correct())


api = API()

@app.route('/python', methods=['POST'])
def python():
    path = request.form['path']
    folderList = request.form['folderList']
    pprint.pprint(folderList)
    return api.python(path, folderList)
