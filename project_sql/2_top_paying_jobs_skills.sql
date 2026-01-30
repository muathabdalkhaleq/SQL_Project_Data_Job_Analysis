--Done--
WITH top_paying_jobs AS(
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
/*  
     tpj.*,
    skills_dim.type 
*/
   
    

    tpj.job_id,
    tpj.job_title,
    tpj.salary_year_avg,
    tpj.company_name,
    skills_job_dim.skill_id,
    skills_dim.type AS skill_name
FROM 
    top_paying_jobs tpj
INNER JOIN skills_job_dim ON tpj.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id


