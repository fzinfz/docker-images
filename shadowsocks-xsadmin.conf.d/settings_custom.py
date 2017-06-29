#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
@author: alishtory
@site: https://github.com/alishtory/xsadmin
@time: 2017/2/26 18:30
@described：用户站点自定义设置
'''
import os
import django


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '05bk@wyb%nm2-=59n08-mu@^t7+#%x$^kk8_%pm_wcnq6ga!2='

ALLOWED_HOSTS = (os.environ.get('ALLOWED_HOST','127.0.0.1') , '172.17.0.1',)
# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'xsadmin',
        'USER':'mysql',
        'PASSWORD': os.environ.get('Mysql_Password',''),
        'HOST': os.environ.get('IP_MYSQL', '127.0.0.1'),
        'PORT':'3306'
    }
}

SITE_CONFIG = {
    'SITE_NAME':'XS Admin',
    'SITE_DESC':'One powerful tool...',
}

NODE_GROUPS = (
    (1, '默认组'),
)

INIT_TRANS_ENABLE = 6*1073741824 #默认是6G的流量

STATIC_ROOT = "/data/xsadmin_deploy/static/"
MEDIA_ROOT = '/data/xsadmin_deploy/upload/'
#极验证
GEE_CAPTCHA_ID = 'b46d1900d0a894591916ea94ea91bd2c'
GEE_PRIVATE_KEY = '36fc3fe98530eea08dfc6ce76e3d24c4'

