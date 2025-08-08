# Security_best_practices

# Trivy file system scannig and Images scanning 

- Trivy is an open-source security scanner designed for DevSecOps pipelines. It scans source code, dependencies, and container images to detect vulnerabilities, misconfigurations, secrets, and software license issues. As a comprehensive tool, Trivy supports both:
- Code scanning: Identifies vulnerabilities in application source code, third-party libraries, and infrastructure-as-code files like Terraform or Kubernetes manifests.
- Image scanning: Detects issues in container images (e.g., Docker), including vulnerabilities in OS packages and all layers of the image, before deployment to production.
- Trivy is widely used in CI/CD processes for its simplicity, speed, and versatility, helping teams secure their code and software supply chain throughout development and deployment

Installing Trivy :
- curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin

Installing Owasp Dependency Check using Jenkins plugins

# installing cloudwatch agent for log monitoring 
- use instance ubuntu 22.04
- install python : apt install python2.7
- install cloudwatch agent : curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
- running agent using : python2.7 awslogs-agent-setup.py --region=us-east-1
- use AWS user credentials with cloudwatch access and set path for the log location
- <img width="1919" height="893" alt="Screenshot 2025-08-08 151406" src="https://github.com/user-attachments/assets/647563c6-e18d-427b-9fbc-60f2540462fc" />


