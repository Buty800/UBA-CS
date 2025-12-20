#!/bin/bash

ORIGINAL_CHECKSUM="1ac82f7daa4c9e644ae4528c04ba5808c35057cb26bc6fc651a9453495cdc07671b71222ee5aabc25876ccbdaad231fb4810b49bf231c291d89625e7fa85737b"

# Check if the file exists
if [[ ! -f "presentacion.md" ]]; then
    echo "Error: presentacion.md not found."
    exit 1
fi

CURRENT_CHECKSUM=$(sha512sum presentacion.md | awk '{print $1}')

if [[ "$CURRENT_CHECKSUM" != "$ORIGINAL_CHECKSUM" ]]; then
    echo "Test passed: Checksum does not match. The file was modified."
    exit 0
else
    echo "Error: Checksum is unchanged."
    exit 1
fi
