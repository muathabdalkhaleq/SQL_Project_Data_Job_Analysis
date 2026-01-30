WITH myrole AS (
    SELECT 
        job_id
    FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst'
)
SELECT
    skills_dim.skills,
    COUNT(*) AS demand_count 
FROM 
    myrole
INNER JOIN skills_job_dim ON myrole.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY demand_count DESC
---------------------end----------------------------------

--prof+same ruslt

/*
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
*/

---------------------end----------------------------------

/*
WITH myrole AS (
    SELECT 
        job_id
    FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst'
)
SELECT 
    skills_dim.skills AS skill_name,
    COUNT(*) AS demand_count
FROM myrole
INNER JOIN skills_job_dim 
    ON myrole.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY demand_count DESC;
---------------------end----------------------------------

