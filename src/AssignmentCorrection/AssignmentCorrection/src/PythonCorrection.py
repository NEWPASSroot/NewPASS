'''
This is the implement of 'Correctoin' in python vertion.
By passing path and folder name list to here, we can ex-
ecute the unittest and return a list of score of each s-
tudents.
'''

from AssignmentCorrection.src import Correction
import subprocess
import os

class PythonCorrection(Correction.Correction):

    def correct(self):
        scoreDict = {}
        for f in self.folders:
            self.generateBat(f)
            self.execute()
            score = self.analysis(f)
            scoreDict[f] = score
        return scoreDict

    def generateBat(self, folder):
        super().generateBat()
        # Write the bat file to execute the unittest
        path = self.path + '/' + folder
        command = 'cd ' + path + '/test\n'
        command += 'nosetests --with-xunit'

        self.bat.write(command)
        self.bat.close()

    def analysis(self, folder):
        # read the test report file in
        path = self.path + '/' + folder + '/test/nosetests.xml'
        f = open(path, 'r')
        xml = f.read()
        f.close()

        # analysis the xml file
        suite = xml.split('><')[1]
        seperate = suite.split(' ')
        tests = int(seperate[2].split('"')[1])
        errors = int(seperate[3].split('"')[1])
        fails = int(seperate[4].split('"')[1])

        score = (tests - errors - fails)/tests *100
        return score
