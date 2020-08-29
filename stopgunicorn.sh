#!/bin/bash
kill -9 `ps aux |grep gunicorn | grep covid19docker | awk '{print $2}'`