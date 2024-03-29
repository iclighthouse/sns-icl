#!/bin/bash

# Extract the args
PROPOSAL_NEURON_ID=$1
PEM_FILE=$2
TARGET_CANISTER_ID=$3
WASM_PATH=$4
SUMMARY=$5
TITLE=$6
URL=$7
UPGRADE_ARG=$8

# Make the proposal using quill
quill sns make-upgrade-canister-proposal $PROPOSAL_NEURON_ID --pem-file $PEM_FILE --canister-ids-file ../sns_canister_ids.json --target-canister-id $TARGET_CANISTER_ID --wasm-path $WASM_PATH --summary $SUMMARY --title $TITLE --url $URL --canister-upgrade-arg $UPGRADE_ARG > upgrade.json
quill send upgrade.json
rm -f upgrade.json