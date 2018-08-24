#!/bin/sh
webhook -hooks hooks.json -verbose -secure -cert /etc/letsencrypt/live/iyyel.io/fullchain.pem -key /etc/letsencrypt/live/iyyel.io/privkey.pem >> webhook.log &
