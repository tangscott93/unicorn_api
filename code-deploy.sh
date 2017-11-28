#!/bin/bash
killall python
cd /home/ec2-user
pip install -r requirements.txt
nohup python app.py &>/dev/null &
