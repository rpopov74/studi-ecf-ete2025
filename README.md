# studi-ecf-ete2025

Projet DevOps de déploiement d’infrastructure et de configuration automatisée avec **Terraform** et **Ansible**.

## 📋 Présentation

Ce projet vise à :
- Provisionner une infrastructure Cloud (VM, réseau, sécurité) avec **Terraform**
- Configurer les machines déployées via **Ansible**
- Appliquer les bonnes pratiques DevOps (modularité, sécurité, automatisation)

## 🗂️ Structure du dépôt

```
.
├── terraform/ # Infrastructure as Code (Terraform) \n
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── modules/
```

## 🚀 Prérequis

- [Terraform](https://www.terraform.io/) >= 1.0.0
- Accès à un fournisseur Cloud compatible (ex: AWS, Azure, GCP)
- Clés d’API/accès pour le Cloud

## ⚙️ Déploiement

### 1. Cloner le dépôt

git clone https://github.com/rpopov74/studi-ecf-ete2025.git
cd studi-ecf-ete2025


### 2. Initialiser et appliquer Terraform

cd terraform
terraform init
terraform validate
terrafform apply
