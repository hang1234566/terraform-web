\# Terraform Web Server - Hyper-V



\## 1. Mục tiêu



Triển khai một Web Server Ubuntu bằng Terraform trên Hyper-V local.



\## 2. Công nghệ sử dụng



\- Terraform

\- Hyper-V

\- Ubuntu Server 24.04.5 LTS

\- Terraform Provider: `windsorcli/hyperv`

\- OpenSSH Server



\## 3. Cấu trúc project



```text

terraform-web/

├── main.tf

├── variables.tf

├── outputs.tf

├── terraform.tfvars

├── README.md

└── screenshot/

&#x20;   ├── terraform-plan.png

&#x20;   ├── terraform-apply.png

&#x20;   └── server-running.png

