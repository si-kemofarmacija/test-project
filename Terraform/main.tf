resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

#Deployment of hello-server
resource "kubernetes_deployment" "hello_server" {
  metadata {
    name      = "hello-server"
    namespace = kubernetes_namespace.namespace.id
  }
  #How the Deployment behaves (replicas, selector, pod template)
  spec {
    replicas = var.server_replicas
    selector {
      match_labels = {
        app = "hello-server"
      }
    }
    #The actual Pod definition (metadata, containers, resources)
    template {
      metadata {
        labels = {
          app = "hello-server"
        }
      }
      #What runs inside the Pod (containers, ports, environment variables)
      spec {
        hostname = "hello-kf-test-srv" #Set the hostname
        subdomain = "hello-kf-test" #Enables internal DNS resolution
        container {
          image = "ubuntu:latest"
          name  = "ansible-runner" # Ansible pre-installed
          command = ["/bin/sh", "-c", "sleep infinity"] #Keep the pod running

          resources {
            limits = var.hello_server_resource_limits
            requests = var.hello_server_resource_requests
          }
        }

        # DNS Configuration
        dns_policy = "None"  # Required to use custom DNS configuration
        dns_config {
          nameservers = [
            "8.8.8.8",  # Google DNS server
            "8.8.4.4"   # Google DNS server
          ]
          searches = [
            "default.svc.cluster.local",
            "svc.cluster.local",
            "cluster.local"
          ]
        }
      }
    }
  }
}