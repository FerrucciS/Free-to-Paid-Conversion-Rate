![image](Images/365datascience.png)
# Free-To-Paid Conversion Rate

## Introduction

As a starting point to applying and honing my skills in data analysis I have decided to undertake the project ["Calculating Free-to-Paid Conversion Rate with SQL Project"](https://365datascience.com/projects/calculating-free-to-paid-conversion-rate-with-sql/) provided by [365datascience](https://learn.365datascience.com).

In addition to the requirements of the project I further explored the data in tableau to provide a nice representation of...........


This is a demonstration of utilising tools such as:
- SQL
- Python
- Tableau

## Problem Statement

The questions posed by 365datascience are:
- What is the free-to-paid convertion rate? In other words what is the ratio of students who purchase a subscription after watching a video to students who have watched a video.
- What is the average time (days) between a student registering to the website and watching their first educational video.
- What is the average time (days) between a student watching their first video and purchasing a subscription.

I also posed the additional questions of:
- How many students who register to the website watch an educational video on the site?


## Data Source

The data is an excerpt from 365datascience's own data, stripped of personally identifiable information. 


## Data Transformation

The database consists of three table: student info, student engagement and student purchases. An SQL subquery joins the relevant data as shown in the venn diagram. Furthemore two additional columns are added consisting of 
1. Days between registration and first watched video - (date_diff_reg_watch).
2. Days between first watched video and subscription purchase - (date_diff_watch_purch).


![image](Images/venndiagram.png)

Furthermore, aggregate functions are used in the main query to calculate 
1) Free-to-paid conversion rate.
2) Average time (days) between registration and watching a video.
3) Average time (days) between first watched video and purchasing a subscription.

## Data Analysis and Visualisation

Using the sqlalchemy package in python a connection to SQL is achieved, allowing deeper analysis of the data. 

### date_diff_reg_watch
- Mode: 0.
- Mean: 3.4.
- Median: 0.

Explanation, Graphs. We did Median (Average) in SQL.

### date_diff_watch_purch
- Mode: 0.
- Mean: 26.2.
- Median: 1.

Explanation, Graphs. We did Median (Average) in SQL.



### Tableau


## Conclusion
