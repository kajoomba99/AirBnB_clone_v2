#!/usr/bin/python3
from fabric.api import *
from datetime import datetime


def do_pack():
    """generates a .tgz archive from the contents of the web_static"""
    now = datetime.now()
    dt_string = now.strftime("%Y%m%d%H%M%S")
    local("mkdir -p versions")
    file_tgz = f"web_static_{dt_string}.tgz"
    path = f"versions/{file_tgz}"
    result = local("tar -czvf {} web_static".format(path))
    if result.failed:
        return None
    return path
