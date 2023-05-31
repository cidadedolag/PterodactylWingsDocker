#!/bin/bash -ex
#
# Receive flags from the docker run command.
#DATADIR=${DATADIR:=/var/lib/pterodactyl}
#
# Execute container-prep.sh to prepare the container.
#/usr/bin/wings/container-prep.sh --DATADIR=/etc/pterodactyl
echo "WINGS_DAEMON_PORT: ${WINGS_DAEMON_PORT}";
echo "WINGS_SFTP_PORT: ${WINGS_SFTP_PORT}";
echo "WINGS_PANEL_URL: ${WINGS_PANEL_URL}";
echo "WINGS_TOKEN: ${WINGS_TOKEN}";
echo "WINGS_NODE: ${WINGS_NODE}";
echo "SSL_EMAIL: ${SSL_EMAIL}";
echo "SSL_FQDN: ${SSL_FQDN}";
# SSL certification by Let's Encrypt.
#certbot certonly --non-interactive --standalone --preferred-challenges http --agree-tos --email ${SSL_EMAIL} -d ${SSL_FQDN};
# Configure the Wings daemon.
mkdir -p /etc/pterodactyl;
cd /etc/pterodactyl;
wings configure --config-path /etc/pterodactyl/config.yaml --panel-url ${WINGS_PANEL_URL} --token ${WINGS_TOKEN} --node ${WINGS_NODE} --override;
# Execute Wings.
wings --debug;
#top;