from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    words = "HELLO WORLD"

    try:
        with open('static/words.txt', 'r') as file:
            words = file.read()
    except FileNotFoundError:
        words = "File 'words.txt' not found."

    html_output = f"""

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" rel="noopener" target="_blank" href="/static/style.css" />
  </head>
  <body>
  <pre>{words}</pre>
  <img src="/static/aioheader.svg" width="800px" />
  </body>
</html>"""
    return html_output
