# studi-ecf-ete2025

Projet DevOps de déploiement d’infrastructure et de configuration automatisée avec **Terraform**.

## 📋 Présentation

Ce projet vise à :
- Provisionner une infrastructure Cloud (VM, réseau, sécurité, stockage) avec **Terraform**

## 🗂️ Structure du dépôt

```
.
├── terraform/ # Infrastructure as Code (Terraform)
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── modules/
```

## 🚀 Prérequis

- [Terraform](https://www.terraform.io/) >= 1.0.0
- Accès à un fournisseur Cloud
- Clés d’API/accès pour le Cloud

## ⚙️ Déploiement

### 1. Cloner le dépôt
```
git clone https://github.com/rpopov74/studi-ecf-ete2025.git
cd studi-ecf-ete2025
```

### 2. Initialiser et appliquer Terraform
```
cd terraform
terraform init
terraform validate
terrafform apply
terraform destroy
```


cd /home/popov/Projets/studi-ecf-ete2025/java

mvn compile

mvn spring-boot:run

docker build -t hello-studi .

docker run -p 8080:8080 hello-studi