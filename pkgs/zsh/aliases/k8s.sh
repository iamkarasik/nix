# Kubernetes alias for kubectl
alias k='kubectl'

# get pods
alias ka='kubectl get pods --all-namespaces'
alias kpods='kubectl get pods'

# Get pod logs
alias klogs='kubectl logs'

# Show cluster nodes
alias knodes='kubectl get nodes'

# Show all services
alias kserv='kubectl get svc'

# Get deployments in all namespaces
alias kdep='kubectl get deployments --all-namespaces'

# Show pod info
alias kdesc='kubectl describe'

# Access a pod’s shell
alias kx='kubectl exec -it'

# Port forward a service
alias kpf='kubectl port-forward'

# Delete all resources in a namespace
alias kdel='kubectl delete'
