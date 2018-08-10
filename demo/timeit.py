import os
import sys
import time
import datetime as dt
import signal
import urllib3
from collections import defaultdict

#SERVER_ADDRESS = 'http://localhost:8000'
SERVER_ADDRESS = 'http://ec2-54-218-107-24.us-west-2.compute.amazonaws.com/'

to_close = []
interrupted = False

records = defaultdict(lambda: [])

def avg10(l):
    if len(l) > 10:
        l = l[:-10]
    return sum(l)/len(l)

def signal_handler(signal, frame):
    global to_close, interrupted
    print('\nsignal_handler: Ctrl+C detected, exiting now...')
    interrupted = True
    for h in to_close:
        h.close()
        print('signal_handler:', h, 'closed.')
    sys.exit(0)

http = urllib3.PoolManager()
r = http.request('GET', SERVER_ADDRESS)
print(r.data.decode().split())


def fun():
    r = http.request('GET', SERVER_ADDRESS)
    text = r.data.decode()
    server = text.split()[2]
    return server

def timed(fun):
    global records
    start = dt.datetime.now()
    server = fun()
    end = dt.datetime.now()
    used_times = end - start
    records[server].append(used_times.microseconds)
    return server, {s: "{0:.0f} ms".format(avg10(l)) for s, l in records.items()}

while True:
    print(timed(fun))
    #time.sleep(.1)
    if interrupted:
        break

signal.signal(signal.SIGINT, signal_handler)
