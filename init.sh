#!/usr/bin/env bash

sudo dnf -y install openssl
sudo sh -c "curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm"

yadm config yadm.auto-perms false
yadm config yadm.cipher openssl

yadm clone --no-bootstrap https://github.com/avano/yadm

yadm decrypt

while true; do
	read -rp "Enter class name: " class_name
	[ -z "${class_name}" ] && break
	yadm config --add local.class "${class_name}"
done

yadm bootstrap
