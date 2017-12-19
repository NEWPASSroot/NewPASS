# Environment Buid (first time to use this server)
1.install [Python 3](https://www.python.org/ftp/python/3.6.4/python-3.6.4.exe)
2.Execute the "setup.bat" file to install the neccessary library for the server.

# Run the server
1.Execute the "exe.bat" file to build and run the server.

# Usage:
You can send data and get response from the server via using 'POST'.

The data you need is:
1.The absolutely path of the folder where you put all students' homework.
2.All of the homework folders' names. Each name should be divided by ';'.

Format:
    {
        'path': '{absolutely path}',
        'folderList': '{file1};{file2};{file3}'
    }

## Python:
url: http://localhost:5000/python
