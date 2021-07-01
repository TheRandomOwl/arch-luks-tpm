#!/bin/sh

install -Dm644 -v -C ./hooks/encrypt-tpm /etc/initcpio/hooks && \
install -Dm644 -v -C ./install/encrypt-tpm /etc/initcpio/install && \
echo "Done" && exit 0 || exit 1
