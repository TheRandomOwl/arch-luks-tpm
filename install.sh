#!/bin/sh

install -Dm644 ./hooks/encrypt-tpm /etc/initcpio/hooks/
install -Dm644 ./install/encrypt-tpm /etc/initcpio/install
