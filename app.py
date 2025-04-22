from flask import Flask, render_template, request, abort

app = Flask(__name__)

## Putting this after app so paws can refer to it after it is initalized
from paws import *  # noqa


@app.route("/")
@app.route("/index.html")
def index():
    if request.method != "GET":
        abort(403)
    return render_template("index.html")


## TODO: Add to submissions file
@app.route("/submission/<number>")
def display_submission(sub_num):
    return render_template("submission.html", sub_num=sub_num)


## TODO: Add the routes to paws files
## Authentication
##@app.route("/login")
##@app.route("/logout")
