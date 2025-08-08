# Security_best_practices

# Tfsec ( Terraform Security ) :
  - tfsec is an open-source static analysis security scanner specifically designed for Terraform code.
  - Its primary usage is to detect vulnerabilities, misconfigurations, and compliance issues in Terraform Infrastructure-as-Code (IaC) files before deployment.
  - tfsec will scan the specified directory. If no directory is specified, the current working directory will be used.
  - The exit status will be non-zero if tfsec finds problems, otherwise the exit status will be zero.
    
**Installation :**
- curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash
