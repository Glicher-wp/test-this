from bottle import route, run, view, static_file
from datetime import datetime as dt
from random import random
from horoscope import generate_prophecies


@route("/")
@view("index")
def index():
    now = dt.now()

    x = random()

    return {
        "date": f"{now.year}-{now.month}-{now.day}",
        "special_date": x > 0.5,
        "x": x,
    }


@route("/api/forcast")
def api_test():
    return {
        "prophesies": generate_prophecies()
    }


run(host="localhost", port=8080, debug=True, autoreload=True)
