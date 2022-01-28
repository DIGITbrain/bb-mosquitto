#!/bin/ash
set -e

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
	[ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

if [ ! -z "${USERNAME}" ] && [ ! -z "${PASSWORD}" ]; then
  # write username, password to password file, then hash
  echo ${USERNAME}:${PASSWORD} >> /mosquitto/passwords
  mosquitto_passwd -U /mosquitto/passwords
fi;

exec "$@"
