# Security_best_practices

Implementing Security practies in CI/CD pipeline to ensure code quality, code security, Image scanning, SAST(static Analysis Software Testing), DAST (Dynamic Analysis Software Testing), Infrastructure code scanning, 

using tools like :

**1. SonarQube :** in branch (SonarQube-SAST)
  - SonarQube is an open-source platform for continuous inspection of code quality, providing in-depth static and dynamic analysis across multiple programming languages.
  - It integrates with development pipelines to detect bugs, code smells, security vulnerabilities, code duplications, and insufficient test coverage, giving developers actionable feedback to improve reliability, maintainability, and security before deploying software
    
**2. Trviy :** in branch (Trivy)
  - Trivy is an open-source security scanner designed for DevSecOps pipelines. It scans source code, dependencies, and container images to detect vulnerabilities, misconfigurations, secrets, and software license issues. As a comprehensive tool, Trivy supports both:
  - Code scanning: Identifies vulnerabilities in application source code, third-party libraries, and infrastructure-as-code files like Terraform or Kubernetes manifests
  - Image scanning: Detects issues in container images (e.g., Docker), including vulnerabilities in OS packages and all layers of the image, before deployment to production

**3. OWASP Dependency Check :**
  - OWASP Dependency-Check is an open-source Software Composition Analysis (SCA) tool designed to identify publicly disclosed vulnerabilities in application dependencies.
  - It scans the third-party libraries and components used in a software project to detect known security issues by matching dependencies against the National Vulnerability Database (NVD) and other vulnerability data sources.
  
**4. Tfsec :** in branch (TfSec_terraform_security)
  - tfsec is an open-source static analysis security scanner specifically designed for Terraform code.
  - Its primary usage is to detect vulnerabilities, misconfigurations, and compliance issues in Terraform Infrastructure-as-Code (IaC) files before deployment.
    

