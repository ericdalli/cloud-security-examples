# Cloud Security Examples

A collection of lightweight, real-world inspired cloud security configurations and best practices for AWS and Azure.  
These examples demonstrate secure defaults, identity hardening, logging, encryption, and network segmentation patterns used in enterprise environments.

---

## ☁️ AWS Examples (`aws/`)

### 1. S3 Secure Bucket
- Block all public access  
- Enforce server-side encryption (AES256 or KMS)  
- Enable versioning  
- Example log-storage use case  

### 2. IAM Least Privilege Role
- Tight, scoped permissions  
- No wildcards  
- MFA-required policy example  

### 3. CloudTrail + CloudWatch Setup
- Organization-wide logging  
- Log integrity controls  
- Encryption with KMS  

---

## 🔷 Azure Examples (`azure/`)

### 1. Storage Account Secure Baseline
- Private endpoints only  
- HTTPS enforced  
- Access keys disabled in favor of Azure AD  

### 2. NSG Segmentation Example
- Zero-trust inspired segmentation rules  
- Strict inbound/outbound  

---

## 📁 Folder Structure

