# Terraform Azure Projects 🚀

This repository contains my hands-on projects while learning **Terraform on Azure**.
###Virtual Network with Subnets
- Create `vnet-dev` with 3 subnets (`default`, `subnet-web`, `subnet_db`)
- CIDR ranges: 10.0.0.0/24, 10.0.1.0/24, 10.0.2.0/24

## Skills Learned
- Infrastructure as Code (IaC)
- Azure Resource Manager with Terraform
- Importing existing Azure resources into Terraform state
- Validating and planning infra changes

---

### 🔗 How to run
```bash
terraform init
terraform plan
terraform apply
