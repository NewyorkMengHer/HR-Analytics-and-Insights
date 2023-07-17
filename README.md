# Human-Resource-Data-Analysis

This project on Human Resources data involves extracting meaningful insights from a comprehensive dataset to optimize HR strategies. It aims to analyze factors influencing employee turnover, improve performance evaluation processes, promote diversity and inclusion, and support effective workforce planning and succession. 

Ultimately, the goal of this project is to utilize insights obtained from data analysis to make well-informed decisions and enhance the management of the organization's human resources.

Small goals includes:
- Adding a new column
- Implementing any form of imputation (filling in missing data based on existing data)
- Displaying aesthetically pleasing and easy-to-understand visuals

# Table of Contents
- [Data Used](https://github.com/NewyorkMengHer/Human-Resource-Data-Analysis/tree/main#data-used)
- [Data Visualization](https://github.com/NewyorkMengHer/Human-Resource-Data-Analysis/tree/main#data-visualization)
- [Analysis Questions](https://github.com/NewyorkMengHer/Human-Resource-Data-Analysis/tree/main#analysis-questions)
- [Summary of Findings](https://github.com/NewyorkMengHer/Human-Resource-Data-Analysis/tree/main#summary-of-findings)
- [Analysis Insights](https://github.com/NewyorkMengHer/Human-Resource-Data-Analysis/tree/main#analysis-insight)

# Data Used

The data used in this project can be found in this GitHub repository: **[Awesome Public Dataset](https://github.com/awesomedata/awesome-public-datasets/tree/master)**. 
Alternatively, the raw data is available [above](https://github.com/NewyorkMengHer/Human-Resource-Data-Analysis/tree/main/raw). 
The HR dataset comprises over 22,000 rows spanning from the year 2000 to 2020. It includes crucial information such as location, hire date, termination date, job titles, and many other relevant variables.

# Data Visualization

Quality data was visualized using PowerBI

![image](images/HR%20Employee%20Distribution%20Report.JPG)

![image](images/HR%20Employee%20Department%20Dashboard.JPG)


# Analysis Questions

Here is a list of questions I aim to query by the end of this project. These questions have been formulated based on the preliminary analysis of the current dataset, prior to data cleaning.

1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?

# Summary of Findings
 - Some records had negative ages and these were excluded during querying (967 records). Ages used were 18 years and above.
 - Some termdates were far into the future and were not included in the analysis (1599 records). The only term dates used were those less than or equal to the current date.
 - White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
 - The youngest employee is 20 years old and the oldest is 57 years old
 - 5 age groups were created (18-24, 25-34, 35-44, 45-54, 55-64). A large number of employees were between 25-34 followed by 35-44 while the smallest group was 55-64.
 - A large number of employees work at the headquarters versus remotely.
 - The average length of employment for terminated employees is around 8 years.
 - The gender distribution across departments is fairly balanced but there are generally more male than female employees.
 - The Auditing department has the highest turnover rate followed by Legal. The least turn over rate are in the Research and development, Support and Legal departments.
 - A large number of employees come from the state of Ohio.
 - The net change in employees has increased over the years. Meaning, the number of employees hired are having a less termination rate over each year
 - The average tenure for each department is about 8 years with Product Mangement having the lowest.

# Analysis Insight

Based on my analysis, I can conclude that the Auditing and Legal department has the highest turnover rate. This suggests a higher level of employee attrition, which can have various implications for an organization. It may indicate potential issues such as dissatisfaction with the work environment, a lack of career growth opportunities, inadequate compensation, or ineffective management practices.

However, in contrast to the Auditing and Legal department, the Engineering department is thriving with success. It not only has the largest number of employees within the organization but also maintains the highest average tenure. Additionally, the department achieves this while maintaining a favorable average turnover rate.

Lastly, this organization has made significant efforts to maintain diversity within the company. While the highest total number of employees is represented by the White demographic, there is a notable presence of other races, with the total number of employees being relatively close in numbers.
