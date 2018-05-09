#!/usr/bin/env bash

NAMESPACE=stable
NODES=($(kubectl get nodes -l kubernetes.io/role=node -o template --template='{{range.items}}{{range.status.addresses}}{{if eq .type "ExternalIP"}}{{.address}}{{end}}{{end}} {{end}}'))
NODE_PORT="$(kubectl -n ${NAMESPACE} get svc ambassador -o=jsonpath='{.spec.ports[0].nodePort}')"

AMBASSADOR_POD="$(kubectl get pods --selector=app=ambassador -n ${NAMESPACE} --output=jsonpath='{.items[0].metadata.name}')"

iterations=10
for i in $(seq 1 ${iterations}); do
    ../../grpcurl.sh -plaintext -d '{"name": "Phil"}' ${NODES[0]}:${NODE_PORT} helloworld.Greeter/SayHello &
done
