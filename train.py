import os
import sys
import logging
import warnings
from urllib.parse import urlparse
import numpy as np
import pandas as pd
import mlflow
import mlflow.sklearn
from mlflow.models import infer_signature
from sqlalchemy import create_engine
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from sklearn.model_selection import train_test_split


logging.basicConfig(level=logging.WARN)
logger = logging.getLogger(__name__)
warnings.filterwarnings("ignore")


# PostgreSQL connection details
DB_HOST = os.environ.get('DB_HOST', 'localhost')
DB_PORT = os.environ.get('DB_PORT', '5432')
DB_NAME = os.environ.get('DB_NAME', 'postgres')
DB_USER = os.environ.get('DB_USER', 'postgres')
DB_PASSWORD = os.environ.get('DB_PASSWORD', 'password')

# SQLAlchemy connection
engine = create_engine(f'postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}')

# Load data from PostgreSQL
query = """
SELECT grlivarea, overallqual, yearbuilt, totalbsmtsf, garagecars, saleprice
FROM house_prices
WHERE saleprice IS NOT NULL;
"""
data = pd.read_sql(query, engine)

# Check for missing values
print(data.isnull().sum())

# Fill missing values if needed
data = data.fillna(0)

# Features and Target
X = data[['grlivarea', 'overallqual', 'yearbuilt', 'totalbsmtsf', 'garagecars']]
y = data['saleprice']

# Train-Test Split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)


# MLflow Experiment Tracking
mlflow.set_experiment("House Price Prediction")

with mlflow.start_run(description="House Price Prediction Run1"):
    # Model Training
    model = LinearRegression()

    model.fit(X_train, y_train)

    # Predictions
    y_pred = model.predict(X_test)

    # Metrics
    rmse = np.sqrt(mean_squared_error(y_test, y_pred))
    mse = mean_squared_error(y_test, y_pred)
    mae = mean_absolute_error(y_test, y_pred)
    r2 = r2_score(y_test, y_pred)

    # Results
    print(f"LinearRegression model:")
    print(f"Root Mean Squared Error: {rmse}")
    print(f"Mean Squared Error: {mse}")
    print(f"Mean Absolute Error: {mae}")
    print(f"R2 Score: {r2}")

    # MLflow Logging
    mlflow.log_param("model_type", "LinearRegression")
    mlflow.log_metric("rmse", rmse)
    mlflow.log_metric("mse", mse)
    mlflow.log_metric("mae", mae)
    mlflow.log_metric("r2_score", r2)

    for i, col in enumerate(X.columns):
        mlflow.log_param(f"coef_{col}", model.coef_[i])

    pred = model.predict(X_train)
    signature = infer_signature(X_train, pred)

    mlflow.sklearn.log_model(model, "linear_regression_model", registered_model_name="HousePricePredictionModel", signature=signature)
