# **Mentoring Week 2 - Data Profiling and Data Quality** #

### Building Data Pipeline with Python and Pyspark - Pacmann AI ###

As a Data Engineer, we need to understand and assessing the quality of a given dataset containing sales data. This responsibilities include:

1. **Data Profiling:** Explore the dataset to gain insights into its structure and attributes.

2. **Data Quality Check:** Assess the validity and consistency of the data. Identify any anomalies or missing values.

3. **Recommendations:** Based on your findings, provide recommendations for cleaning and improving the dataset.


# Dataset
## How to use this project?
1. Preparations
2. Run Docker Compose


### 1. Preparations
- **Clone repo** :
  ```
  git clone https://github.com/hudiyaresa/Data-Profiling-And-Quality
  ```

- **Create env file** in project root directory :
  ```
  # Source
  SRC_POSTGRES_DB=...
  SRC_POSTGRES_HOST=...
  SRC_POSTGRES_USER=...
  SRC_POSTGRES_PASSWORD=...
  SRC_POSTGRES_PORT=...
  ```

### 2. Run Docker Compose :
  ```
  docker compose up -d
  ```

### 3. Run Jupyter Notebook :

Open and run the notebook [paccafe.ipynb](https://github.com/hudiyaresa/Data-Profiling-And-Quality/blob/main/paccafe.ipynb)