# test-project

## TODO add steps how to reproduce results

# 🚀 Test Project: Kubernetes & Ansible Automation

This project automates the deployment of a test server inside a **local Kubernetes cluster** using Terraform, Ansible, and GitHub Actions. The Ansible playbook downloads and executes a script (`hello.sh`) from GitHub inside a Kubernetes pod.

---

## 🏆 **GitHub Actions Status**
[![CI for hello.sh](https://github.com/stojc998/kemofarmacija-test-project/actions/workflows/ci-script.yml/badge.svg)](https://github.com/stojc998/kemofarmacija-test-project/actions/workflows/ci-script.yml)

---

## 🔧 **Prerequisites**
Ensure you have the following installed:

1. [Minikube](https://minikube.sigs.k8s.io/docs/start/)
2. [Terraform](https://developer.hashicorp.com/terraform/downloads)
3. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
4. [Git](https://git-scm.com/downloads)

---

## 🚀 **Setup & Execution Steps**

### **1️⃣ Start Minikube**
Before deploying Kubernetes resources, start Minikube:

- `minikube start`

## **2. Deploy Kubernetes infrastructure**

Move into the Terraform folder

- `cd Terraform/`

and execute these commands:

- `terraform init        # Initialize Terraform`
- `terraform validate    # Optional: Validate Terraform code`
- `terraform plan        # Preview resources before creation`
- `terraform apply       # Deploy infrastructure`

This will:
Create a Kubernetes pod (ansible-runner).
Assign the hostname hello-kf-test-srv to the pods.

## **3. Run Ansible playbook**

Navigate to the project root where ansible-script.yml is located.

If you are still in the Terraform folder do:

- `cd ..`

And execute:

- `ansible-playbook ansible-script.yml`

The playbook will:
Install necessary dependencies inside the ansible-runner pod.
Download hello.sh from the GitHub repository.
Execute hello.sh inside the pod for 10 seconds and then terminate it.

## **4. Cleanup**

Remove all deployed resources. Navigate to Terraform folder:

- `cd Terraform/`

and execute:

- `terraform destroy`

Stop minikube if you no longer need it:

- `minikube stop`