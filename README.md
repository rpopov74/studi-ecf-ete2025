# studi-ecf-ete2025

Projet DevOps de déploiement d’infrastructure et de configuration automatisée avec **Terraform**, **Maven**, **Docker**, et **JavaScript**.

## 📋 Présentation

Ce projet vise à :
- Provisionner une infrastructure Cloud (VM, réseau, sécurité, stockage) avec **Terraform**.
- Déployer une application Java avec **Spring Boot**.
- Conteneuriser l'application avec **Docker**.
- Lancer une application front-end avec **JavaScript** et **Expo**.

## 🗂️ Structure du dépôt

```
.
├── terraform/                # Infrastructure as Code (Terraform)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
├── java/                     # Application backend en Java (Spring Boot)
│   ├── src/
│   ├── pom.xml
│   └── mvnw
├── javascript/HelloWorldApp/ # Application front-end en JavaScript (Expo)
│   ├── App.js
│   └── package.json
└── README.md                 # Documentation du projet
```

## 🚀 Prérequis

### Outils nécessaires :
- [Terraform](https://www.terraform.io/) >= 1.0.0
- [Java JDK](https://www.oracle.com/java/technologies/javase-downloads.html) >= 21
- [Maven](https://maven.apache.org/) >= 3.8.0
- [Docker](https://www.docker.com/) >= 20.10
- [Node.js](https://nodejs.org/) >= 16.x
- [Expo CLI](https://expo.dev/) (installé via `npm`)

### Accès requis :
- Accès à un fournisseur Cloud AWS
- Clés d’API/accès pour le Cloud.

---

## ⚙️ Déploiement

### 1. Cloner le dépôt
```bash
git clone https://github.com/rpopov74/studi-ecf-ete2025.git
cd studi-ecf-ete2025
```

---

### 2. Déployer l'infrastructure avec Terraform
```bash
cd terraform
terraform init          # Initialiser Terraform
terraform validate      # Valider la configuration
terraform apply         # Appliquer la configuration
terraform destroy       # Détruire l'infrastructure (si nécessaire)
```

---

### 3. Lancer l'application backend (Java)
#### a) Compiler le projet avec Maven
```bash
cd java
./mvnw compile
```

#### b) Lancer l'application Spring Boot
```bash
./mvnw spring-boot:run
```

L'application sera accessible sur [http://localhost:8080](http://localhost:8080).

---

### 4. Conteneuriser l'application avec Docker
#### a) Construire l'image Docker
```bash
docker build -t hello-studi .
```

#### b) Lancer le conteneur
```bash
docker run -p 8080:8080 hello-studi
```

L'application sera accessible sur [http://localhost:8080](http://localhost:8080).

---

### 5. Lancer l'application front-end (JavaScript)
#### a) Installer les dépendances
```bash
cd javascript/HelloWorldApp
npm install
```

#### b) Lancer l'application avec Expo
```bash
npx expo start
```

Scannez le QR code affiché dans le terminal avec l'application Expo Go sur votre téléphone pour voir l'application.

Lancement de l app avec la stack de supervision

docker compose up -d

---

## 🛠️ Fonctionnalités

### Backend (Java/Spring Boot)
- API REST pour gérer les données.
- Configuration de sécurité avec Spring Security.

### Frontend (JavaScript/Expo)
- Interface utilisateur simple pour interagir avec l'API backend.

### Infrastructure (Terraform)
- Provisionnement d'une infrastructure Cloud :
  - VPC, sous-réseaux, passerelle NAT.
  - Instance EC2 pour le backend.
  - Bucket S3 pour le stockage.

---

## 📖 Documentation supplémentaire

### Terraform
- [Documentation officielle](https://www.terraform.io/docs)

### Spring Boot
- [Documentation officielle](https://spring.io/projects/spring-boot)

### Docker
- [Documentation officielle](https://docs.docker.com/)

### Expo
- [Documentation officielle](https://docs.expo.dev/)

---

## 🤝 Contribuer

Les contributions sont les bienvenues ! Veuillez ouvrir une issue ou soumettre une pull request pour toute amélioration ou correction.

---

## 📜 Licence

Ce projet est sous licence Apache 2.0. Consultez le fichier `LICENSE` pour plus d'informations.# studi-ecf-ete2025
