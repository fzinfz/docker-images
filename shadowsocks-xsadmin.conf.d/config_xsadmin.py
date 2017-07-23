#!/usr/bin/env python
# -*- coding:utf-8 -*-
import os

API_INTERVAL = 8  #每100s更新一次
API_URL = 'http://' + os.environ.get("SS_XSADMIN_HOST_PORT") +'/api/user_port/'
API_KEY = os.environ.get("SS_XSADMIN_API_KEY")
API_SECRET = os.environ.get("SS_XSADMIN_API_SECRET")
