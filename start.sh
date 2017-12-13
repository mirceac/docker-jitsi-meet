#!/bin/bash

unset DEBIAN_FRONTEND

cp /var/lib/prosody/localhost.key /etc/prosody/certs/
cp /var/lib/prosody/localhost.crt /etc/prosody/certs/
cp /var/lib/prosody/auth.localhost.key /etc/prosody/certs/
cp /var/lib/prosody/auth.localhost.crt /etc/prosody/certs/
cp /var/lib/prosody/localhost.key /etc/jitsi/meet/
cp /var/lib/prosody/localhost.crt /etc/jitsi/meet/

service prosody restart
service jitsi-videobridge restart
service jicofo restart
exec nginx -g 'daemon off;'
