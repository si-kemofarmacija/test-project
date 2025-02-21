variable "server_replicas" {
  description = "Number of replicas for the server deployment."
  type        = number
  default     = 2
}

variable "namespace" {
  description = "Namespace where pods are."
  type        = string
  default     = "app"
}

variable "hello_server_resource_limits" {
  description = "hello-server pods resource limits."
  type = map(string)
  default = {
    memory = "256Mi"
    cpu    = "500m"
  }
}

variable "hello_server_resource_requests" {
  description = "hello-server pods resource requests."
  type = map(string)
  default = {
    memory = "128Mi"
    cpu    = "250m"
  }
}