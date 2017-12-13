apt-get update
apt-get upgrade

apt-get -y install --no-install-recommends wget nginx dnsutils vim telnet gnupg2
echo 'deb http://download.jitsi.org/ stable/' >> /etc/apt/sources.list
wget -qO - https://download.jitsi.org/nightly/deb/unstable/archive.key | apt-key add -

apt-get update

apt-get --allow-unauthenticated -y install jitsi-meet
apt-get clean
