#!/bin/bash
gunicorn --workers 3 --daemon --bind 0.0.0.0:8000 covid19.wsgi && tail -f /dev/null