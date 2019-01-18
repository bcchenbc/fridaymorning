import os
import datetime as dt
import time

from flask import Flask

from fluent import sender
from fluent import event

app = Flask(__name__)

sender.setup('helloflask', host='localhost', port=24224)

@app.route("/")
def hello():
    host = os.environ["HOSTNAME"]
    now = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    event.Event('hello', {'host': host, 'datetime': now})
    time.sleep(.034)
    return "It's something-running-on-{}!\nIt's now {}.".format(host, now)

if __name__ == "__main__":
    # Only for debugging while developing
    app.run(host='0.0.0.0', debug=True, port=80)
