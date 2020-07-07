""" utilities for running tasks in the piper ecosystem """
import logging
import os
import re
import sys
import time

from invoke import task

logger = logging.getLogger()
logger.setLevel(logging.INFO)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.INFO)

formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)

SD_PATH = "/Volumes/boot"

@task
def rasp_pi_zero_setup(c):
    logger.info("Running raspberry pi zero setup")

    # enable wireless networking
    wpa_path = "{}/wpa_supplicant.conf".format(SD_PATH)
    c.run("touch {}".format(wpa_path))
    c.run("cat sample_wpa.conf > {}".format(wpa_path))

    # enable ssh
    c.run("touch {}/ssh".format(SD_PATH))
    return

