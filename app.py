from flask import Flask, redirect, render_template, request, abort, url_for

app = Flask(__name__)


@app.route("/")
def index():
    if request.method == "GET":
        abort(403)
    return render_template("index.html")


@app.route("/index.html")
def index_html():
    return redirect(url_for("/"))
