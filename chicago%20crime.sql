select * from chicago_crime_data;

--rename primary type column to crime type.
ALTER TABLE chicago_crime_data RENAME COLUMN primary_type TO crime_type;


-- crime frequency. summary of each crime type.
SELECT CRIME_TYPE, COUNT(*) as num_crimes
FROM chicago_crime_data
GROUP BY CRIME_TYPE;

-- arrest rate. count arrests made for each crime committed.
SELECT CRIME_TYPE, COUNT(*) as num_crimes, SUM(CASE WHEN ARREST = 'TRUE' THEN 1 ELSE 0 END) as num_arrests
FROM chicago_crime_data
GROUP BY CRIME_TYPE;

-- crime by district. number of crimes in each district.
SELECT DISTRICT, COUNT(*) as num_crimes
FROM chicago_crime_data
GROUP BY DISTRICT
ORDER BY num_crimes;

-- time based analysis.
SELECT YEAR(DATE) as year, COUNT(*) as num_crimes
FROM chicago_crime_data
GROUP BY YEAR(DATE)
ORDER BY year;

--Crime by community area: 
SELECT COMMUNITY_AREA_NUMBER, COUNT(*) as num_crimes
FROM chicago_crime_data
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY num_crimes DESC;







