#!/usr/bin/env bash
set -o nounset
set -o errexit

NAMESPACE=ambassador-sbx0
AMBASSADOR_POD="$(kubectl get pods --selector=app=ambassador -n ${NAMESPACE} --output=jsonpath='{.items[0].metadata.name}')"
AMBASSADOR_FWD_PORT=8877

kubectl -n ${NAMESPACE} port-forward "$AMBASSADOR_POD" "$AMBASSADOR_FWD_PORT"

python -mwebbrowser "http://localhost:$AMBASSADOR_FWD_PORT/ambassador/v0/diag/"
