![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# CE7 Group 2 Capstone Project

## Dev/UAT/Prod Github Branch strategy

![git branch2](https://github.com/user-attachments/assets/a1adccf3-c3bc-4e1e-8ed6-d7c7e93d6d1c)
<sub>Image from Valaxy Technologies.</sub>

### Pros and Cons of Dev/UAT/Prod Branch Strategy
**Pros**
- Simplicity: This strategy is straightforward, making it easier for teams to understand and implement. Developers can work directly in the DEV branch, and changes flow through UAT to PROD without complex branching structures.
- Continuous Development: Development can continue uninterrupted during releases, as new features can be worked on in the DEV branch while UAT and PROD are being updated.
- Clear Environment Segregation: Each branch corresponds to a specific environment (DEV for development, UAT for testing, PROD for production), which helps maintain clarity about what code is being tested or deployed.
- Hotfix Management: The strategy allows for quick hotfixes directly to the PROD branch without disrupting ongoing development.
  
**Cons**
- Limited Control Over Releases: If multiple features are in development, it can be challenging to release only certain features if others are not ready. This can lead to delays or the need for complex merges.
- Potential for Code Drift: Continuous merging into DEV could lead to integration issues if not managed properly, as features might not be tested together until later stages.
- Less Granular Control: Compared to GitFlow, this strategy may provide less control over which features are included in each release since it typically promotes all changes from DEV to UAT at once.

### Pros and Cons of GitFlow
**Pros**
- Structured Release Process: GitFlow offers a more structured approach with dedicated branches for features, releases, and hotfixes, allowing teams to manage releases more granularly.
- Isolation of Features: Each feature can be developed in isolation on its own branch, reducing the risk of conflicts and making it easier to manage complex projects with multiple features being developed simultaneously.
- Selective Merging: Teams can cherry-pick which features to promote to production by merging specific branches rather than merging everything from DEV at once. This allows for more control over what goes live.
  
**Cons**
- Complexity: The additional branches and rules can complicate the workflow, especially for smaller teams or projects. New team members may find it harder to navigate compared to simpler strategies like Dev, UAT, Prod.
- Slower Release Cycles: The structured nature of GitFlow may slow down the release process since features must go through multiple branches and approvals before reaching production.
- Overhead Management: Managing multiple branches requires more overhead in terms of maintaining them and ensuring they are up-to-date with the latest changes from other branches.

### Conclusion

The Dev/UAT/Prod strategy is beneficial for small teams like ours seeking simplicity and continuous development on smaller projects.
It may lack the granularity of control offered by GitFlow, which provides a robust framework suitable for larger projects.
However, Gitflow introduces additional complexity that may not be necessary for all teams.


## OpenID Connect (OIDC)

![image](https://github.com/user-attachments/assets/aa51e9c6-ca29-4458-8510-e9a1595fa9df)

GitHub OpenID Connect (OIDC) offers several advantages for CI/CD workflows:

1. Elimination of Long-Lived Secrets
    - OIDC removes the need for storing long-lived cloud credentials in GitHub, reducing the risk of credential exposure.
2. Enhanced Security with Temporary Credentials
    - Tokens are short-lived, minimizing the impact of any potential compromise since they expire quickly.
3. Simplified Credential Management
    - OIDC streamlines credential management by eliminating the need for manual rotation and updates, leading to increased efficiency.
4. Improved Access Control
    - Organizations can define specific permissions for access tokens, enhancing security by ensuring only authorized workflows can access resources.
5. Seamless Integration with Cloud Providers
    - OIDC supports multiple cloud providers, allowing teams to deploy applications without changing authentication methods.
6. Better Compliance with Security Standards
    - Adopting OIDC helps organizations align with security best practices, minimizing the use of long-lived credentials.

https://www.parsectix.com/blog/github-oidc

https://blog.clouddrove.com/github-actions-openid-connect-the-key-to-aws-authentication-dd9f66a7d31e
##

This repository contains Terraform files.

project-root/ (grp2-capstone/devops-terraform-eks-2mod/)  
├── modules/  
│   ├── eks/  
│   │   ├── eks.tf          # EKS cluster configuration  
│   │   ├── iam.tf          # IAM roles and policies for EKS  
│   │   ├── lb.tf           # Load balancer configuration  
│   │   ├── outputs.tf      # EKS module outputs  
│   │   ├── security.tf     # Security groups for EKS  
│   │   └── variables.tf    # EKS module variables  
│   └── network/  
│       ├── network.tf      # VPC, subnets configuration  
│       ├── outputs.tf      # Network module outputs  
│       ├── variables.tf    # Network module variables  
│       └── vpc.tf         # VPC specific resources  
├── .gitignore              # Git ignore patterns  
├── terraform/              # Terraform backend configuration  
├── app.py                  # Application code  
├── Dockerfile             # Docker configuration  
├── ecr.tf                 # ECR repository configuration  
├── hello_there.py         # Sample application  
├── main.tf               # Main configuration file  
├── outputs.tf            # Root module outputs  
├── provider.tf           # AWS provider configuration  
├── README.md             # Project documentation  
├── terraform.tfstate     # Terraform state file  
├── terraform.tfstate.backup # Terraform state backup  
└── variables.tf          # Root module variables  
