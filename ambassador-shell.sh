#!/usr/bin/env bash
set -o nounset
set -o errexit

NAMESPACE=stable
AMBASSADOR_POD="$(kubectl get pods --selector=app=ambassador -n ${NAMESPACE} --output=jsonpath='{.items[0].metadata.name}')"
AMBASSADOR_FWD_PORT=8877

kubectl exec -n ${NAMESPACE} -it ${AMBASSADOR_POD} -- /bin/sh
