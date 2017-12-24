import MySQLdb
import warnings

class DatabaseHandler:
    def Load_Database(self, host_url, databaseName, account, password, path):
        #db = MySQLdb.connect(host="127.0.0.1", user="root", passwd="1234", db="ezscrum")
        db = MySQLdb.connect( host_url, account, password, databaseName)
        # Open and read the file as a single buffer
        fd = open(path , 'r')
        sqlFile = fd.read()
        fd.close()
        # all SQL commands (split on ';')
        sqlCommands = sqlFile.split(';')
        db = MySQLdb.connect(host=host_url, user=account, passwd=password, db=databaseName, charset='utf8')
        cursor = db.cursor()
        # ignore useless warnings
        warnings.filterwarnings('ignore', 'Unknown table .*')
        warnings.filterwarnings('ignore', 'Changing sql mode*')
        warnings.filterwarnings('ignore', "'" + 'NO_ZERO_DATE*')
        # Execute every command from the input file
        for command in sqlCommands:
            try:
                if command:
                    cursor.execute(command)
            except MySQLdb.OperationalError:
                print "Command error: " + command
            except MySQLdb.Warning:
                print "Command warning: " + command

    def is_delete(self, tableName):
        reservedTableNameList = ["mantis_user_table", "mantis_tokens_table", "mantis_config_table"]
        isDeleteFlag = 1
        for name in reservedTableNameList:
            isIdentical = cmp(tableName, name)
            if isIdentical == 0:
                isDeleteFlag = 0
                break
        return isDeleteFlag

    def Clean_Database(self, hostUrl, account, password, databaseName):
        db = MySQLdb.connect(host=hostUrl, user=account, passwd=password, db=databaseName)
        cursor = db.cursor()

        cursor.execute("Show Tables from " + databaseName)
        result = cursor.fetchall()

        for record in result:
            tableName = record[0]
            # isDelete = self.is_delete(tableName)
            # if isDelete == 0:
            #     print "Reserve " + tableName
            #
            # else :
            #     print "TRUNCATE TABLE `" + tableName + "`"
            command = "DELETE FROM " + tableName + " WHERE 1"
            cursor.execute(command)

        db.commit()
        db.close()



#if __name__ == '__main__':
#    databaseHandler = DatabaseHandler()
#    databaseHandler.clean_database("localhost", "spark", "spark", "robottest")
