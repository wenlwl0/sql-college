# College Admissions Database — SQL

A relational database project designed to model college admissions processes using SQL Server. This database organizes applicant information, applications, academic history, campus and major preferences, scholarships, admissions decisions, and standardized testing data into a structured relational schema.

SQL skills in this project include **database schema design, primary and foreign keys, relational modeling, data insertion, multi-table joins, subqueries, aggregation, filtering, and analytical queries**.

## Project Overview

The goal of this project is to build a normalized relational database that can support a college admissions system and answer business-oriented questions about applicants and applications.

The database models relationships between:

* Applicants and their demographic information
* College applications and admission plans
* High school history and GPA
* Colleges and schools attended
* Majors and major preferences
* Campus preferences and rankings
* Scholarship applications and decisions
* Numerical testing programs and scores
* Languages and proficiency levels

The project is structured into three main components:

```text
sql-college/
├── schema.sql/
│   └── Tables by Lili Lee.sql
│
├── inserts.sql/
│   ├── Insert 1 (ADV) by Lili Lee.sql
│   ├── Insert 2 (ADV) by Lili Lee.sql
│   └── Insert 3 (BASIC) by Lili Lee.sql
│
└── queries.sql/
    ├── Select 1 by Lili Lee.sql
    ├── Select 2 by Lili Lee.sql
    └── Select 3 by Lili Lee.sql
```

## Database Schema

The database uses a relational model with **primary keys and foreign keys** to connect related entities.

Key entities include:

| Entity                    | Purpose                                                       |
| ------------------------- | ------------------------------------------------------------- |
| `Applicant`               | Stores applicant demographic and personal information         |
| `Applications`            | Connects applicants to admission cycles and application plans |
| `School`                  | Stores information about schools attended                     |
| `SchoolList`              | Records an applicant's school history and GPA                 |
| `Major`                   | Stores available majors                                       |
| `MajorInterestList`       | Tracks applicants' major preferences and admission results    |
| `Campus`                  | Stores campus information                                     |
| `CampusInterestList`      | Tracks campus preferences for applications                    |
| `Scholarship`             | Stores available scholarships                                 |
| `ScholarshipInterestList` | Tracks scholarship applications and results                   |
| `NumericalTestProgram`    | Stores standardized testing programs                          |
| `NumericalTestTaken`      | Records applicant test scores                                 |
| `Languages`               | Stores languages associated with applicants                   |
| `LanguageList`            | Records language proficiency levels                           |

The schema contains relationships between these entities through foreign keys. For example:

```text
Applicant
   │
   ├── Applications
   │      ├── MajorInterestList
   │      ├── CampusInterestList
   │      └── ScholarshipInterestList
   │
   ├── SchoolList
   │
   ├── ApplicantPhone
   │
   ├── ApplicantEmail
   │
   ├── LanguageList
   │
   └── NumericalTestTaken
```

## SQL Concepts Demonstrated

### Database Design

* Relational database modeling
* Primary keys
* Foreign keys
* Entity relationships
* Lookup/reference tables
* Normalized table structures
* Identity columns

### Data Manipulation

* `INSERT`
* Multiple-row data insertion
* Relational data population
* Maintaining foreign-key relationships

### Data Retrieval

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* `DISTINCT`
* `INNER JOIN`
* `LEFT JOIN`
* Aggregate functions
* Subqueries
* Variables
* Conditional filtering

### Advanced Querying

The advanced queries combine information from multiple related tables to answer admissions-related business questions.

For example, one query identifies applicants who may be lower-priority candidates for a particular scholarship by combining:

* Admission plan
* Graduation class
* Campus preference
* Citizenship status
* Household income
* Major admission results
* Scholarship status
* High school GPA
* Other accepted scholarships

The query uses multiple joins, derived tables, aggregate calculations, subqueries, variables, grouping, and sorting to produce the final result.

## Example Analysis

One of the advanced queries evaluates applicants for the **Dumbledore Scholarship**.

The analysis:

1. Filters applicants by admission plan and graduation class.
2. Limits applicants to a specific campus.
3. Identifies international applicants.
4. Filters for higher household-income ranges.
5. Requires applicants to have been accepted to a major.
6. Selects applicants whose scholarship application is still pending.
7. Checks whether applicants have already received other scholarships.
8. Calculates a normalized high-school GPA ratio.
9. Counts accepted and pending scholarship applicants.
10. Orders applicants from lowest to highest GPA ratio.

## How to Use

### 1. Clone the repository

```bash
git clone https://github.com/wenlwl0/sql-college.git
cd sql-college
```

### 2. Create the database schema

Run:

```text
schema.sql/Tables by Lili Lee.sql
```

This creates the tables and establishes the primary-key and foreign-key relationships.

### 3. Insert the data in order

Run the scripts in the `inserts.sql` directory:

```text
Insert 1 (ADV) by Lili Lee.sql
Insert 2 (ADV) by Lili Lee.sql
Insert 3 (BASIC) by Lili Lee.sql
```

### 4. Run the queries

The `queries.sql` directory contains progressively more complex SQL queries:

```text
Select 1 by Lili Lee.sql
Select 2 by Lili Lee.sql
Select 3 by Lili Lee.sql
```

## Skills Demonstrated

This project demonstrates experience with:

**SQL & Databases**

* Relational database design
* SQL Server
* Schema creation
* Data modeling
* Primary and foreign keys
* Data insertion
* Complex joins
* Subqueries
* Aggregation
* Data filtering
* Analytical querying
