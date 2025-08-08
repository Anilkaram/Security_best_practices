# Security_best_practices

# Tfsec ( Terraform Security ) :
  - tfsec is an open-source static analysis security scanner specifically designed for Terraform code.
  - Its primary usage is to detect vulnerabilities, misconfigurations, and compliance issues in Terraform Infrastructure-as-Code (IaC) files before deployment.
  - tfsec will scan the specified directory. If no directory is specified, the current working directory will be used.
  - The exit status will be non-zero if tfsec finds problems, otherwise the exit status will be zero.
    
**Installation :**
- curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash

for vulnerabilities to solve using code: https://aquasecurity.github.io/tfsec/latest/
- tfsec repo: https://github.com/aquasecurity/tfsec?tab=readme-ov-file
# for scanning code use # **tfsec .**


- **after scanning terraform code**

<img width="1920" height="1032" alt="Screenshot (329)" src="https://github.com/user-attachments/assets/07325ab1-fc52-4391-987e-9e640a62b874" />
<img width="1920" height="987" alt="Screenshot (328)" src="https://github.com/user-attachments/assets/9410d24d-4ff7-44a8-987f-d6a9c6719297" />

- trying to fix issues using code, getting fixes solution from https://aquasecurity.github.io/tfsec/latest/ issues droped from 33 to 16
<img width="1920" height="1080" alt="Screenshot (331)" src="https://github.com/user-attachments/assets/d85ea10e-6f00-471f-850b-7ec9929ad562" />

# Finally fixed all the isses :
  
  <img width="858" height="874" alt="Screenshot 2025-08-09 002834" src="https://github.com/user-attachments/assets/0a0dd089-f452-4d93-9f2c-e32a9f936e09" />
