from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return """
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" rel="noopener" target="_blank" href="/static/style.css" />
  </head>
  <body>
  <img src="/static/aioheader.svg" width="800px" />
  </body>
</html>"""
