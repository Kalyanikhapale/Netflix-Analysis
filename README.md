# 🎬 Netflix Dataset SQL Analysis

## 📌 Project Overview

![Netflix Logo](netflix_logo.png)

This project involves **exploratory data analysis (EDA) and querying** of a Netflix dataset using **MySQL**.
The goal is to explore Netflix's content library, understand patterns, and answer specific business-related questions using SQL queries.

---

## 📂 Dataset Information

* **Dataset Name:** Netflix\_Dataset.csv
* **Imported Using:** MySQL Table Data Import Wizard
* **Number of Columns:** Title, Director, Cast, Country, Date Added, Release Year, Rating, Duration, Description, etc.
* **Data Source:** Public Netflix data (for learning purposes)

---

## ⚙️ Tools & Technologies

* **Database:** MySQL
* **Import Method:** Table Data Import Wizard (MySQL Workbench)
* **Language:** SQL

---

## 🛠️ Steps Followed

1. **Imported the dataset** into MySQL using Table Data Import Wizard.
2. **Renamed the table** for easier reference:

   ```sql
   RENAME TABLE netflix_dataset TO netflix;
   ```
3. **Checked data quality** – null values, duplicates, and inconsistent formatting.
4. **Converted `date_added` column** to a proper date format:

   ```sql
   UPDATE netflix  
   SET added_date = STR_TO_DATE(date_added, '%M %d, %Y')  
   WHERE date_added IS NOT NULL;
   ```
5. **Executed SQL queries** to answer specific analysis questions.

---

## 📊 Questions & Queries

| Q.No | Question                                                                        |
| ---- | ------------------------------------------------------------------------------- |
| 1    | Count the number of Movies vs TV Shows                                          |
| 2    | Find the most common rating for movies and TV shows                             |
| 3    | List all movies released in a specific year (e.g., 2020)                        |
| 4    | Find the top 5 countries with the most content                                  |
| 5    | Identify the longest movie                                                      |
| 6    | Find content added in the last 5 years                                          |
| 7    | Find all the movies/TV shows by director 'Rajiv Chilaka'                        |
| 8    | List all TV shows with more than 5 seasons                                      |
| 9    | Count the number of content items in each genre                                 |
| 10   | Find each year and the average numbers of content releases in India             |
| 11   | List all movies that are documentaries                                          |
| 12   | Find all content without a director                                             |
| 13   | Find how many movies 'Aishwarya Rai Bachchan' appeared in the last 10 years     |
| 14   | Find the top 10 actors who have appeared in the highest number of Indian movies |
| 15   | Categorize content as 'Good' or 'Bad' based on keywords 'kill'/'violence'       |

---
## 📈 Example Insights
📺 Movies dominate over TV shows in the dataset.

🎭 Most common ratings differ for movies and TV shows.

🇮🇳 India ranks among the top producers of Netflix content.

🎬 The longest movie exceeds 200 minutes.

🧾 Certain keywords help categorize content sentiment.

----

## 📈 Key Learnings

* Importing CSV files into MySQL using Table Data Import Wizard.
* Writing **aggregate queries** with `COUNT`, `GROUP BY`, and `ORDER BY`.
* Using `LIKE` and `LOWER()` for flexible text search.
* Filtering by date ranges using `YEAR()` and `CURDATE()`.

---

## 📌 How to Use

1. Clone this repository.
2. Open **MySQL Workbench**.
3. Import the dataset using **Table Data Import Wizard**.
4. Run the SQL queries from the provided script file.

---
## Author
### Kalyani Khapale
[Data Analysis Using SQL]
