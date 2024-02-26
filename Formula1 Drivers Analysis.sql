-- 1. Which drivers have the highest number of race wins?

SELECT Driver, Race_Wins
FROM drivers
WHERE Race_Wins <> 0
ORDER BY Race_Wins DESC;

-- 2. Who has the highest number of podium finishes?

SELECT Driver, Podiums
FROM drivers
WHERE Podiums <> 0
ORDER BY Podiums DESC;

-- 3. Which driver has the highest number of pole positions?

SELECT Driver, Pole_Positions
FROM drivers
WHERE Pole_Positions <> 0
ORDER BY Pole_Positions DESC;

-- 4. What is the average number of race wins per driver?

SELECT 
	ROUND(AVG(Race_Wins),1) AS Average_Wins_Per_Driver   
FROM drivers;

-- 5. Which drivers have the highest win rates?

SELECT 
	Driver, 
	ROUND(Win_Rate,2) as Win_Rate 
FROM DRIVERS
WHERE ROUND(Win_Rate,2) <> 0
ORDER BY Win_Rate DESC; 

-- 6. How does the distribution of championships won vary by nationality?

SELECT 
	Nationality,
	SUM(Championships) as Number_of_Championships
FROM drivers
GROUP BY Nationality
ORDER BY Number_of_Championships DESC;

-- 7. Are there any correlations between nationality and performance metrics like race wins or podium finishes?

SELECT 
	Nationality,
	ROUND(AVG(Race_Wins),0) AS Average_Race_Wins,   
	ROUND(AVG(Podiums),0) AS Average_Podium_Finishes
FROM drivers
GROUP BY Nationality;


-- 8. How does the distribution of drivers by nationality change over the decades?

SELECT 
    Decade,
	Nationality,
    COUNT(DISTINCT Driver) AS Total_Drivers
FROM 
    drivers
GROUP BY 
    Decade,
    Nationality
ORDER BY 
    Decade,
    Total_Drivers DESC;

-- 9. How many seasons, on average, do drivers compete in Formula 1?

SELECT 
	AVG(Years_Active) AS Average_Number_of_Seasons  
FROM drivers;

-- 10. Are there drivers who have competed for a significantly longer period than others?

SELECT 
	Driver,
	Years_Active
FROM drivers
ORDER BY Years_Active DESC;


-- 11. What is the distribution of drivers based on the number of seasons they have participated in?

SELECT 
	Years_Active,
	COUNT(*) AS Number_of_Drivers
FROM drivers
GROUP BY Years_Active
ORDER BY Years_Active DESC;


-- 12. What is the distribution of race starts among drivers?

SELECT 
	Race_Starts,
	COUNT(*) AS Number_of_Drivers  
FROM drivers
GROUP BY Race_Starts
ORDER BY Number_of_Drivers desc;

-- 13. What is the average number of race starts per driver?

SELECT 
	ROUND(AVG(Race_Starts),0) AS Average_Race_Starts   
FROM drivers;

-- 14. How many championships have been won by each driver?

SELECT 
	Driver,
	Championships
FROM drivers
ORDER BY Championships DESC;

-- 15. How many drivers have won multiple championships?

SELECT 
	COUNT(Driver) AS Drivers_with_multiple_championships
FROM drivers
WHERE Championships > 1;

-- Displaying  drivers that won multiple championships

SELECT 
	Driver,
	Championships
FROM drivers
WHERE Championships > 1
ORDER BY Championships DESC;

-- 16. Is there any correlation between the number of championship wins and other performance metrics like race wins or podium finishes?

--Comparing championship wins with race wins

SELECT
	Championships,
	Race_Wins,
	COUNT(*) AS Number_of_Drivers
FROM drivers
GROUP BY
	Championships,
	Race_Wins
ORDER BY 
	Championships DESC,
	Race_Wins DESC;

-- Comparing championship wins with podium finishes

SELECT 
	Championships,
	Podiums,
	COUNT(*) AS Number_of_Drivers
FROM drivers
GROUP BY 
	Championships, 
	Podiums
ORDER BY 
	Championships DESC, 
	Podiums DESC;

-- 17. What is the distribution of points earned among drivers?

SELECT 
	Points,
	COUNT(*) AS Number_of_Drivers
FROM drivers
GROUP BY Points
ORDER BY Number_of_Drivers DESC;


-- Distribution by point ranges

WITH PointRanges AS (
	SELECT
		CASE
			WHEN Points = 0 THEN '0 Points'
            WHEN Points <= 50 THEN '1-50 Points'
            WHEN Points <= 100 THEN '51-100 Points'
            WHEN Points <= 200 THEN '101-200 Points'
            WHEN Points <= 500 THEN '201-500 Points'
            WHEN Points <= 1000 THEN '501-1000 Points'
            WHEN Points <= 2000 THEN '1001-2000 Points'
            WHEN Points <= 3000 THEN '2001-3000 Points'
            ELSE 'More than 3000 Points'
		END AS Point_Range
	FROM drivers
)
SELECT 	
	COUNT(*) AS Number_of_Divers,
	Point_Range
FROM PointRanges
GROUP BY Point_Range
ORDER BY Number_of_Divers DESC;

-- 18. Which driver has the highest number of fastest laps?

SELECT 
	Driver,
	Fastest_Laps
FROM drivers
ORDER BY Fastest_Laps DESC;

-- 19. Is there any correlation between fastest laps and other performance metrics?

SELECT 
	Fastest_Laps,
	Podiums,
	Race_Wins,
	COUNT(*) AS Number_of_Drivers
FROM drivers
GROUP BY 
	Fastest_Laps,
	Podiums,
	Race_Wins
ORDER BY 
	Number_of_Drivers DESC;


-- 20. Was there any trend in the average points earned by drivers over different decades?
--	   Did any specific decade have a particularly high number of unique race winners or podium drivers?

SELECT
	Decade,
	COUNT(DISTINCT CASE WHEN Race_Wins > 0 THEN Driver END) AS Unique_Race_Winners,
	COUNT(DISTINCT CASE WHEN Podiums > 0 THEN Driver END) AS Unique_Podium_Winners,
	SUM(Points) AS Total_Points,
	ROUND(AVG(Points),2) AS Average_Points_Per_Driver  
FROM drivers
GROUP BY Decade
ORDER BY Decade;

-- 21. How do different nationalities compare in terms of total race wins, podium finishes, championships, and points?

SELECT 
	Nationality,
	COUNT(*) AS Total_Drivers,
	SUM(Race_Wins) AS Total_Race_Wins,
	SUM(Podiums) AS Total_Podium_Finishes,
	SUM(Championships) AS Total_Championships,
	SUM(Points) AS Total_Points
FROM drivers
GROUP BY Nationality
ORDER BY 
	Total_Race_Wins DESC,
	Total_Podium_Finishes DESC,
	Total_Championships DESC,
	Total_Points DESC;

-- 22. How do different drivers compare in terms of performance metrics?

SELECT
	Driver,
	Race_Entries,
	Race_Starts,
	ROUND(Win_Rate,3) AS Race_Wins_Per_Entry, 
	ROUND(Podium_Rate,2) AS Podiums_Per_Entry, 
	ROUND(Points_Per_Entry,2) AS Points_Per_Entry
FROM drivers
ORDER BY Race_Entries DESC;

-- 23. How does the win rate change over time?

SELECT 
	Decade,
	ROUND(SUM(Race_Wins) / NULLIF(SUM(Race_Starts), 0), 3) AS Win_Rate
FROM drivers
GROUP BY Decade
ORDER BY Decade;

-- 24. How do the statistics (race wins, podiums, etc.) differ between active and retired drivers?
--	   Are there any notable differences in the performance metrics between active and retired drivers?

SELECT 
	CASE	
		WHEN Active = 1 THEN 'Active'
		WHEN Active = 0 THEN 'Retired'
	END AS Driver_Status,
	COUNT(*) AS Total_Drivers,
	ROUND(AVG(Race_Wins), 1) AS Average_Race_Wins,
	ROUND(AVG(Podiums), 1) AS Average_Podium_Finishes,
	ROUND(AVG(Points), 2) AS Average_Points,
	ROUND(AVG(Championships), 2) AS Average_Championships
FROM drivers
GROUP BY 
	CASE	
		WHEN Active = 1 THEN 'Active'
		WHEN Active = 0 THEN 'Retired'
	END;

-- 25. How has the average points per race start evolved across different decades? 

SELECT 
	Decade,
	ROUND(SUM(Points) / NULLIF(SUM(Race_Starts), 0), 1) AS Points_Per_Start
FROM drivers
GROUP BY Decade
ORDER BY Decade;