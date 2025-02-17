#!/bin/bash
set -x

get_kubeconfig() {
    local student_id=$1
    local namespace=$2
    local sa_name="${student_id}-${namespace}-sa"
    local kubeconfig_file="kubeconfig-${student_id}-${namespace}.yaml"

    kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: ${sa_name}-token
  namespace: ${student_id}-${namespace}
  annotations:
    kubernetes.io/service-account.name: ${sa_name}
type: kubernetes.io/service-account-token
EOF

    sleep 2

    local token=$(kubectl get secret ${sa_name}-token -n ${student_id}-${namespace} -o jsonpath='{.data.token}' | base64 -d)

    cat > kubeconfigs/${kubeconfig_file} << EOF
apiVersion: v1
kind: Config
clusters:
- name: msp-spring-2025
  cluster:
    insecure-skip-tls-verify: true
    server: https://hcp-6da04d29-ab65-4bdf-9b23-cb2b79f0ff70.spot.rackspace.com/
contexts:
- name: ${student_id}-${namespace}
  context:
    cluster: msp-spring-2025
    namespace: ${student_id}-${namespace}
    user: ${sa_name}
current-context: ${student_id}-${namespace}
users:
- name: ${sa_name}
  user:
    token: ${token}
EOF

    echo "Created kubeconfig for ${student_id}'s ${namespace} environment at ${kubeconfig_file}"
}

students=$(yq e '.students[].id' values.yaml)

for student in ${students}; do
    get_kubeconfig "${student}" "dev"
    get_kubeconfig "${student}" "prod"
done
