#!/bin/bash

docker run --privileged -h mircea.meet.ro --name meet -p 443:443 -v "$PWD"/confprosody/conf/:/etc/prosody/conf.d/ -v "$PWD"/confprosody/certs/:/etc/prosody/certs/ -v "$PWD"/conf/:/etc/jitsi/ -v "$PWD"/confnginx/:/etc/nginx/sites-enabled/ sipxcom/meet
