from peewee import *

import db_postgresql

class BaseModel(Model):
    class Meta:
        database = db_postgresql