# Data Folder

This folder is reserved for cleaned, non-sensitive datasets used in the analysis.

- Please place your cleaned survey CSV here as: `clean_survey.csv`
- Raw or confidential datasets must **NOT** be uploaded or committed to the repository.

Example command for reading it:
```r
read_csv("data/clean_survey.csv")

3. Save the file as:
inside the `data/` folder.

---

### ✅ Step 4: In your main folder, create a `.gitignore` file (if you don’t already have one)

1. In the root folder of your project (same level as your main README), create a new file:

2. Paste the following into it:

```gitignore
# Ignore raw data files
data/raw/
data/*secret*
data/*confidential*
