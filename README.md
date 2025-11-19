# weather-api-gke-cicd

# Weather API - GKE + CI/CD Pipeline


## Opis projektu

Weather API to prosta aplikacja REST w Javie (Spring Boot), która udostępnia dane pogodowe.  
Projekt demonstruje pełny pipeline DevOps na Google Cloud Platform (GCP) z wykorzystaniem:

- Google Kubernetes Engine (GKE) do uruchomienia aplikacji w kontenerach
- Cloud Build do automatycznego budowania obrazów Docker i deploymentu
- Artifact Registry jako repozytorium obrazów Docker
- GitOps: automatyczne wdrożenia po pushu do repozytorium
- Cloud Monitoring (Logging i Metrics) do monitorowania aplikacji
- IAM do kontroli dostępu

---

## Struktura repozytorium

- `/src` – kod źródłowy aplikacji Java (Spring Boot)
- `Dockerfile` – plik do budowy obrazu Docker dla aplikacji
- `cloudbuild.yaml` – konfiguracja pipeline CI/CD w Google Cloud Build
- `k8s/` – manifesty Kubernetes do wdrożenia aplikacji (deployment, service)
- `README.md` – dokumentacja projektu

---

## Wymagania

- Google Cloud Platform (konto z uprawnieniami do GKE, Artifact Registry, Cloud Build)
- Google Cloud SDK (`gcloud`)
- Docker
- Maven 3.x
- Kubectl

---

## Jak uruchomić lokalnie

1. Sklonuj repozytorium:

   ```bash
   git clone https://github.com/joannawalach1/weather-api-gke-cicd.git
   cd weather-api-gke-cicd
   
2. Zbuduj aplikację i uruchom lokalnie:

  ```bash
mvn clean package
java -jar target/*.jar


3. Aplikacja będzie dostępna pod adresem: http://localhost:8081/

  ```bash
docker build -t weather-api .
docker run -p 8081:8081 weather-api

