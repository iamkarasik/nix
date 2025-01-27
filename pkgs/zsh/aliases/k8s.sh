# Kubernetes alias for kubectl
alias k='kubectl'

# List pods in all namespaces
alias ka='kubectl get pods --all-namespaces'

# Get pod logs
alias kl='kubectl logs'

# Show cluster nodes
alias kn='kubectl get nodes'

# Show all services
alias ks='kubectl get svc --all-namespaces'

# Get deployments in all namespaces
alias kd='kubectl get deployments --all-namespaces'

# Show pod info
alias kdi='kubectl describe pod'

# Access a pod’s shell
alias kex='kubectl exec -it'

# Port forward a service
alias kpf='kubectl port-forward'

# Deploy from a YAML file
alias kapply='kubectl apply -f'

# Delete all resources in a namespace
alias kdel='kubectl delete --all --namespace'
