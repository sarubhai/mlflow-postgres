# MLflow Sklearn Demo

## Prerequisites
Ensure you have the following installed:
- Python 3.11
- Docker & Docker Compose

## Setup
- Clone the Repository

```
git clone https://github.com/sarubhai/mlflow-postgres.git
cd mlflow-postgres
```

- Create and Activate a Virtual Environment

```
python3 -m venv env
source env/bin/activate
```

- Install Dependencies

```
pip3 install -r requirements.txt
```

- Start PostgreSQL with Docker

```
docker compose -f postgresql-docker-compose.yml up -d
```

- Set Environment Variables

```
export DB_HOST=127.0.0.1
export DB_PORT=5434
export DB_PASSWORD="Passw0rd1234"
```

- Run Data Ingestion Script

```
python3 ingestion.py
```

- Start MLflow Tracking Server

```
mlflow server --host 127.0.0.1 --port 8080
```

## Running Training Script

In a new terminal window, activate the virtual environment and set environment variables:

```
source env/bin/activate

export MLFLOW_TRACKING_URI=http://localhost:8080
export MLFLOW_TRACKING_INSECURE_TLS=true
export DB_HOST=127.0.0.1
export DB_PORT=5434
export DB_PASSWORD="Passw0rd1234"

python3 train.py
```

## Access MLflow UI
Visit:
http://127.0.0.1:8080/

## Cleanup
To stop and remove the PostgreSQL container:

```
docker compose -f postgresql-docker-compose.yml down -v
```

To deactivate the virtual environment:

```
deactivate
```

