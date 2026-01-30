
/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > $70,000 
- Filter for Data Analyst Jobs and order by salary
*/
SELECT *
FROM (
    SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs
)AS quarter1_job_postings 
WHERE 
    quarter1_job_postings.salary_year_avg > 7000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
