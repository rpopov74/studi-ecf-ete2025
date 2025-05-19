# studi-ecf-ete2025

Projet DevOps de déploiement d’infrastructure et de configuration automatisée avec **Terraform**, **Maven**, **Docker**, **Spring Boot** et **JavaScript/Expo**.

---

## 📋 Présentation

Ce projet a pour objectif de :
- Provisionner une infrastructure Cloud (VM, réseau, sécurité, stockage) avec **Terraform**
- Déployer et conteneuriser une application backend Java (**Spring Boot**)
- Lancer une application front-end (**JavaScript/Expo**)
- Mettre en place une stack de supervision (Prometheus, Grafana, JMX Exporter)

---

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


---

## 🚀 Prérequis

- [Terraform](https://www.terraform.io/) ≥ 1.0.0
- [Java JDK](https://www.oracle.com/java/technologies/javase-downloads.html) ≥ 21
- [Maven](https://maven.apache.org/) ≥ 3.8.0
- [Docker](https://www.docker.com/) ≥ 20.10
- [Node.js](https://nodejs.org/) ≥ 16.x
- [Expo CLI](https://expo.dev/) (`npm install -g expo-cli`)
- Accès à AWS (ou autre provider cloud) et clés d’API

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
./mvnw clean package
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


### 6. Conteneuriser et superviser avec Docker Compose

```
cd java

#Pour lancer la stack (appli + supervision)
docker compose up -d

#Pour stopper la stack
docker compose down
```

L'agent JMX Exporter est connecté sur prometheus 

- **Prometheus :** [http://localhost:9090/targets](http://localhost:9090/targets)

Grafana est configue avec le dashbord JVM Micrometer (4701)

- **Grafana :** [http://localhost:3000](http://localhost:3000)

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
