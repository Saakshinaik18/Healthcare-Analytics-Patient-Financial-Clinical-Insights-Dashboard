#Total patient

SELECT COUNT(*) AS Total_Patients
FROM healthcarecleaned_data;
SELECT COUNT(*) AS Total_Patients
FROM healthcare;

#Gender Distribution to know males or females using healthcare services more?

SELECT Gender,
COUNT(*) AS Patient_Count
FROM healthcarecleaned_data
GROUP BY Gender;

#Which Age segments require more healthcare services

SELECT Age_Group,
COUNT(*) AS Patients
FROM healthcarecleaned_data
GROUP BY Age_Group
ORDER BY Patients DESC;

#Total No of Disease

SELECT `Medical Condition`,
       COUNT(*) AS Patients
FROM healthcarecleaned_data
GROUP BY `Medical Condition`
ORDER BY Patients DESC;

#Revenue Disease
SELECT `Medical Condition`,
       ROUND(SUM(`Billing Amount`),2) AS Revenue
FROM healthcarecleaned_data
GROUP BY `Medical Condition`
ORDER BY Revenue DESC;

#Average Billing by disease
SELECT `Medical Condition`,
       ROUND(AVG(`Billing Amount`),2) AS Avg_Billing
FROM healthcarecleaned_data
GROUP BY `Medical Condition`
ORDER BY Avg_Billing DESC;

#Insurance Provided Analysis

SELECT `Insurance Provider`,
       COUNT(*) AS Patients,
       ROUND(SUM(`Billing Amount`),2) AS Revenue
FROM healthcarecleaned_data
GROUP BY `Insurance Provider`
ORDER BY Revenue DESC;

#Medication Analysis

SELECT Medication,
       COUNT(*) AS Prescription_Count
FROM healthcarecleaned_data
GROUP BY Medication
ORDER BY Prescription_Count DESC;

#Admission Type analysis
SELECT `Admission Type`,
       COUNT(*) AS Admissions
FROM healthcarecleaned_data
GROUP BY `Admission Type`;

#Length of Stay Analysis
SELECT `Medical Condition`,
       ROUND(AVG(Length_of_Stay),2) AS Avg_Stay
FROM healthcarecleaned_data
GROUP BY `Medical Condition`
ORDER BY Avg_Stay DESC;

SELECT `Insurance Provider`,
       ROUND(SUM(`Billing Amount`),2) AS Revenue
FROM healthcarecleaned_data
GROUP BY `Insurance Provider`
ORDER BY Revenue DESC;


UPDATE healthcarecleaned_data
SET Name = CONCAT(
    UPPER(SUBSTRING(SUBSTRING_INDEX(Name, ' ', 1), 1, 1)),
    LOWER(SUBSTRING(SUBSTRING_INDEX(Name, ' ', 1), 2)),
    ' ',
    UPPER(SUBSTRING(SUBSTRING_INDEX(Name, ' ', -1), 1, 1)),
    LOWER(SUBSTRING(SUBSTRING_INDEX(Name, ' ', -1), 2))
);

SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;

SELECT Name FROM healthcarecleaned_data LIMIT 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE healthcarecleaned_data
SET Name = CONCAT(
    UPPER(LEFT(SUBSTRING_INDEX(TRIM(Name), ' ', 1), 1)),
    LOWER(SUBSTRING(SUBSTRING_INDEX(TRIM(Name), ' ', 1), 2)),
    ' ',
    UPPER(LEFT(SUBSTRING_INDEX(TRIM(Name), ' ', -1), 1)),
    LOWER(SUBSTRING(SUBSTRING_INDEX(TRIM(Name), ' ', -1), 2))
);

SET SQL_SAFE_UPDATES = 1;

SELECT Name FROM healthcarecleaned_data LIMIT 10;