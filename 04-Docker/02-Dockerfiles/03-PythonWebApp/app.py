from flask import Flask
import os 
import socket


app = Flask(__name__)

@app.route("/")
def hello():
    return "Welcome for Python WebApp"

@app.route("/info")
def hello_info():
    html = "<h2>Hello World</h2>"\
           "<b>Hostname:</b> {hostname}"
    return html.format(hostname=socket.gethostname())

if __name__ == "__main__":
   app.run(host='0.0.0.0', port=8081)
