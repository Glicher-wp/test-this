import os
from bottle import route, run, view, static_file
from datetime import datetime as dt
from random import random
from horoscope import generate_prophecies


@route("/static/<filename:path>")
def send_static(filename):
    return static_file(filename, root="static")


@route("/")
@view("predictions")
def index():
    now = dt.now()
    x = random()
    return {
        "date": f"{now.year}-{now.month}-{now.day}",
        "special_date": x > 0.5,
        "x": x,
    }


@route("/views/<filename:path>")
def about(filename):
    return static_file(filename, root="views")



@route("/api/forcast")
def api_test():
    return {
        "prophesies": generate_prophecies()
    }


if os.environ.get('APP_LOCATION') == 'heroku':
    run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
else:
    run(host="localhost", port=8080, debug=True, autoreload=True)
