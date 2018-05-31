#!/usr/bin/env bash

NAMESPACE="ambassador-sbx0"
AMBASSADOR_LB="$(kubectl get svc ambassador -n ${NAMESPACE} -o=jsonpath='{.status.loadBalancer.ingress[0].hostname}')"

printf "${AMBASSADOR_LB}"