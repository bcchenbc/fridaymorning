sudo apt-get update \
    && sudo apt-get install -y python3-pip \
    && sudo pip3 install locustio pyzmq

locust -f my_locustfile.py --master
locust -f my_locustfile.py --slave --master-host=192.168.0.14
