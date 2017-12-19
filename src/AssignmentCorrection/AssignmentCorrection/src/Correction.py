'''
This is the abstract class of the correction of each language.
Each language correction should inheritance 'Correction', and
follow the given template. It's optional to extend other meth-
ods if it is neccessary.
'''

import os
import subprocess


class Correction:
    def __init__(self, path, folderList):
        self.path = path
        self.folders = folderList.split(';')

    def execute(self):
        # Execute the batFile we got
        if not os.path.exists(self.batName):
            raise Exception("Bat file is not generated")
        command = self.batName
        subprocess.call(command, shell=True)
        os.remove(self.batName)

    def correct(self):
        raise Exception("No correct function for this language. ")

    def generateBat(self):
        self.batName = 'run.bat'
        if os.path.exists(self.batName):
            os.remove(self.batName)
        self.bat = open(self.batName, 'w')

    def analysis(self):
        raise Exception("No function to analysis the resulting xml files. ")

    # def connectMysql(self):
    #     self.mysql = MySQL()
    #
    #     # MySQL configurations
    #     app.config['MYSQL_DATABASE_USER'] = 'root'
    #     app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
    #     app.config['MYSQL_DATABASE_DB'] = 'pass'
    #     app.config['MYSQL_DATABASE_HOST'] = 'localhost'
    #     self.mysql.init_app(app)
    #
    #     self.conn = self.mysql.connect()
    #     self.cursor = self.conn.cursor()
    #
    # def getAssignments(self):
    #     command = "SELECT homework_file_name FROM submit_homeworks WHERE teacher_assignment_id=1"
    #     assignments = self.cursor.execute(command)
    #     print(assignments.__class__)
    #     pprint.pprint(assignments)
    #     return str(assignments)
