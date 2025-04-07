# 🚀 DevOps Project: AWS Infrastructure with Terraform, EKS, and CI/CD

This project builds a fully isolated, production-grade DevOps infrastructure on AWS using **Terraform**, modular **Infrastructure as Code (IaC)**, and **EKS (Elastic Kubernetes Service)**. It supports multiple environments like **test**, **staging**, and **production**, each with its own dedicated VPC, subnets, EKS cluster, and bastion host.

---

## 🔧 Tech Stack

- **Terraform** – Infrastructure as Code
- **AWS** – EKS, EC2, VPC, Subnets, NAT, IAM
- **Kubernetes** – Container orchestration
- **Jenkins / GitHub Actions** – CI/CD Pipeline (coming soon)
- **Docker** – Containerized Java app
- **Cloud-native best practices**

---

## 📁 Project Structure

```
DevOps-Project/
├── main.tf                   # Root Terraform logic
├── variables.tf              # Input variables
├── outputs.tf                # Outputs per env
├── provider.tf               # AWS provider config
├── environments/             # tfvars for each environment
│   ├── test.tfvars
│   ├── staging.tfvars
│   └── prod.tfvars
├── modules/                  # Terraform modules
│   ├── vpc/
│   ├── eks/
│   └── ec2_bastion/
└── k8s/                      # Kubernetes manifests (coming soon)
```

---

## 🌍 Environments

Each environment (`test`, `staging`, `prod`) is completely isolated, with:

- Its own **VPC and subnet CIDRs**
- Separate **public/private subnets**
- A dedicated **EKS cluster**
- A dedicated **bastion EC2 instance**
- **Unique state file** via `.tfvars` and workspaces

---

## 🚀 How to Use

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Create or Select a Workspace

```bash
terraform workspace new test      # Run once per environment
terraform workspace select test
```

### 3. Apply Infrastructure for the Environment

```bash
terraform apply -var-file=environments/test.tfvars
```

> Repeat for `staging.tfvars` and `prod.tfvars`.

---

## ✅ Coming Soon

- ✅ CI/CD Pipeline with Jenkins or GitHub Actions
- ✅ Automated deployment to EKS from container registry
- ✅ App deployment via `kubectl apply` or Helm
- ✅ Monitoring with CloudWatch, Prometheus, Grafana
- ✅ Ingress, SSL, DNS, and autoscaling

---

## 🔐 IAM Access Required

Make sure your IAM user/role has the following AWS permissions:

- `eks:*`
- `ec2:*`
- `vpc:*`
- `iam:*`
- `ecr:*`
- `autoscaling:*`

---

## 🙌 Author

**[@13v13reddy](https://github.com/13v13reddy)** — DevOps enthusiast building real-world infrastructure from scratch!

---

## 📜 License

This project is open source and available under the [MIT License](LICENSE).
