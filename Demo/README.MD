
# 🌩️ Terraform AWS Setup and IAM User Creation

This guide covers how to:

1. Configure the AWS provider
2. Create IAM users
3. Understand best practices
4. Execute Terraform commands step-by-step

---

## 🚀 1. Configure the AWS Provider

### Example 1: Basic AWS Provider Setup

```hcl
provider "aws" {
  version = "~> 5.0"
  region  = "us-east-1"
}
```

- **`version`**: Ensures you're using version 5.x of the AWS provider.
- **`region`**: The AWS region your infrastructure will be deployed to.

### ⚠️ Example 2: Hard-Coded Credentials (NOT RECOMMENDED)

```hcl
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

> ⚠️ **Warning**: Avoid hard-coding credentials! It poses a **security risk** if committed to version control.  
> ✅ Use environment variables, AWS CLI profiles, or Terraform Cloud workspaces instead.

---

## 👤 2. Create IAM Users

### IAM User 1

```hcl
resource "aws_iam_user" "User1" {
  name = "Name1"
  path = "/"
}
```

- Creates a user named `Name1` under the root IAM path (`/`).

### IAM User 2

```hcl
resource "aws_iam_user" "User2" {
  name = "Name2"
  path = "/custom_path/"
}
```

- Creates a user named `Name2` under a custom IAM path (`/custom_path/`).

---

## 🛠️ 3. Terraform Commands to Run

1️⃣ **Initialize Terraform**
```bash
terraform init
```
> Downloads required providers and sets up the working directory.

2️⃣ **Review the Execution Plan**
```bash
terraform validate
```
> Validate the .tf, If any syntax error.

3️⃣ **Review the Execution Plan**
```bash
terraform plan
```
> Shows what will be created, changed, or destroyed before applying.

4️⃣ **Apply the Configuration**
```bash
terraform apply
```
> Provisions the resources on AWS. You'll be prompted to confirm.

**or**

```bash
terraform apply --auto-approve
```
> Provisions the resources on AWS. Without prompted confirm.

5️⃣ **Clean Up Resources**
```bash
terraform destroy
```
> Destroys all resources created by Terraform. Use with caution!

---

## ✅ Best Practices

- 🔒 **Use AWS credentials via environment variables:**
  ```bash
  export AWS_ACCESS_KEY_ID="your-access-key"
  export AWS_SECRET_ACCESS_KEY="your-secret-key"
  ```

- 🧾 **Use a `.tfvars` file or `terraform.tfvars` for input variables.**

- 🔐 **Store secrets in a secure vault (e.g., AWS Secrets Manager, HashiCorp Vault).**

- ✅ **Use remote backends** (like S3 with DynamoDB) for storing Terraform state files in production.

---

## 🔚 Summary

With just a few lines of code and some simple commands, you can:

- Configure the AWS provider securely
- Create IAM users
- Automate infrastructure with repeatable code

> Ready to build more? Try adding IAM policies, S3 buckets, or VPCs next!