**PLS-SEM Analysis for Survey Data**

**Author:** Ahmad Lutfi Che Hasan
**Created:** 10-5-2025
**Last Updated:** 20-5-2025

---

## 1. Project Overview

This repository contains a streamlined PLS-SEM workflow implemented in R using the modified `seminrlocal` package. The analysis investigates latent constructs and their relationships in a survey data, following the Theory of Planned Behavior framework.

Key features:

* Data preprocessing and factor recoding
* Measurement model (indicator selection)
* Structural model specification and estimation
* Bootstrapping for path significance
* Reliability and predictive assessments
* Mediation analysis for indirect effects

## 2. Repository Structure

```text
├── data/
│   └── README.md            # Instructions for adding your own data
├── R/
│   ├── setup.R        # install and load packages
│   ├── models.R       # measurement + structural models
│   ├── analysis.R     # runs analysis (can source models.R)
├── outputs/
│   ├── plots/               # PNG/PDF of SEM diagrams and diagnostics
│   └── tables/              # CSV or markdown exports of results
├── .gitignore               # Exclude raw data and environment files
└── README.md                
```

## 3. Data Handling

* **Data folder:** The `data/` directory is for storing a cleaned copy of your CSV (not the raw). Place your file as `data/clean_survey.csv`.
* **Sensitive data:** DO NOT commit raw or sensitive files. Use `.gitignore` to exclude anything under `data/raw/`.
* **README in data/:** Explains file naming conventions

## 4. Dependencies

Install required packages before running the analysis:

```r
# CRAN packages
install.packages(c("tidyverse", "DiagrammeR", "igraph", "psych"))

# seminrlocal from GitHub
remotes::install_github("afihasan/seminrlocal")
```

## 5. Running the Analysis
````
1. Clone the repository:
git clone [https://github.com/afihasan/pls-sem-survey-analysis.git](https://github.com/afihasan/pls-sem-survey-analysis.git)
cd pls-sem-survey-analysis

2. Add your cleaned survey CSV to `data/clean_survey.csv`.

3. Open `scripts/pls_sem_analysis.R` in RStudio or your editor.

4. Source or run the script:
```r
source("scripts/pls_sem_analysis.R")
````

5. Review outputs in the `outputs/` folder.

## 6. Results Interpretation

* **Construct Reliability & Validity:** Check loadings, Cronbach’s alpha, AVE.
* **Path Coefficients & Significance:** Review bootstrapped CIs for each relationship.
* **R² & f²:** Assess explanatory power and effect sizes.
* **Mediation Tests:** Evaluate indirect vs direct effects.

## 7. Contributing and License

This is a personal analysis project. If you adapt or extend it, please credit the author. For commercial usage or collaboration, contact Ahmad Lutfi Che Hasan.

---
