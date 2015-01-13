#!/usr/bin/python
import requests

__author__ = 'dave'

HOTSPOT_IP = "192.168.1.1"
HOTSPOT_PASSWORD = "dadcyirh"

if __name__ == "__main__":

    session = requests.Session()

    session.get("http://" + HOTSPOT_IP + "/model.json")

    session_id = session.cookies.get("sessionId")

    token = session_id[session_id.find("-")+1:]

    init_form_dict = {"session.password": HOTSPOT_PASSWORD,
                      "ok_redirect": "/success.json",
                      "err_redirect": "/error.json",
                      "token": token}

    session.post("http://" + HOTSPOT_IP + "/Forms/config", init_form_dict)

    restart_form_dict = {"general.shutdown": "Restart",
                         "ok_redirect": "/success.json",
                         "err_redirect": "/error.json",
                         "token": token}

    session.post("http://" + HOTSPOT_IP + "/Forms/config", restart_form_dict)
