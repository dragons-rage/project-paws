from flask import render_template
from app import app  # Import main app


@app.errorhandler(404)
def error_404(e):
    return render_template("404.html", error=e), 404
