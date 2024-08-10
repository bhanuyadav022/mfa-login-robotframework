import os
from dotenv import load_dotenv
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger

env= BuiltIn().get_variable_value('${ENV}')

# supported env
supported_env = ["test", "dev", "staging"]
if env in supported_env:
    load_dotenv(os.path.join(os.path.dirname(__file__),f"../../.env_{env}"))
    USERNAME = os.getenv("UNAME")
    PASSWORD = os.getenv("PASSWORD")
    LOGIN_URL = os.getenv('HOST')+"/login"
    MFA_URL   = os.getenv("HOST")+ "/signup"
else:
    logger.console(f"{env} is invalid or unspported")
    exit()




