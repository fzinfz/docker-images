import os	

API_INTERVAL = 8 	
API_URL = 'http://' + os.environ.get("SS_XSADMIN_SERVER") +'/api/user_port/'		
API_KEY = os.environ.get("SS_XSADMIN_API_KEY")		
API_SECRET = os.environ.get("SS_XSADMIN_API_SECRET")
