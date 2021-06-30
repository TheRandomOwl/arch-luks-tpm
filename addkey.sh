#!/bin/sh

KEY_DIR="/tmp"
PCR="0,2,4,7"
tpm2_evictcontrol -C o -c 0x81000000
tpm2_createpolicy --policy-pcr -l sha1:$PCR -L policy.digest && \
tpm2_createprimary -C e -g sha1 -G rsa -c primary.context && \
dd bs=128 count=1 if=/dev/random of=$KEY_DIR/secret.bin iflag=fullblock && \
tpm2_create -g sha256 -u obj.pub -r obj.priv -C primary.context -L policy.digest -a "noda|adminwithpolicy|fixedparent|fixedtpm" -i $KEY_DIR/secret.bin && \
tpm2_load -C primary.context -u obj.pub -r obj.priv -c load.context && \
tpm2_evictcontrol -C o -c load.context 0x81000000 && \
rm load.context obj.priv obj.pub policy.digest primary.context && \
echo "Done" ; exit 0 || echo "Something went wrong" ; exit 1
