

from flask import Flask, render_template, send_from_directory

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("index.html", title="Portfolio - Home")


@app.route("/about")
def about():
    return render_template("about.html", title="Portfolio - About")


@app.route("/projects")
def projects():
    return render_template("projects.html", title="Portfolio - Projects")


@app.route("/static/<path:path>")
def send_static(path):
    return send_from_directory("static", path)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
