# Formula 1 Data Analytics Project

![alt text](<Formula1 Drivers Dashboard.png>)

## Table of Contents

- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools](#tools)
- [Questions](#questions)
- [Key Findings](#key-findings)
- [Limitations](#limitations)

## Project Overview

This data analysis project aims to provide insights into the performance of Formula 1 drivers over the decades. The dataset includes information on drivers' race wins, podium finishes, championships, and more. SQL analysis reveals insights such as the distribution of drivers by nationality, trends in race wins and podium places over time, and correlations between performance indicators. The key results are visualized on the Power BI dashboard, which allows the visuals to be filtered by decades.

## Data Source

**Formula 1 Drivers Data:** The dataset used for this analysis is the "F1DriversDataset.csv" file, containing detailed information about drivers participating in Formula 1 seasons from 1950 till 2022. Dataset comes from [Kaggle](https://www.kaggle.com/datasets/dubradave/formula-1-drivers-dataset).

## Tools

- Microsoft SQL Server - Data Analysis
- Power BI - Creating Report

## Questions

During the analysis, attempts were made to answer the following questions:

1. Which drivers have the highest number of race wins?
2. Who has the highest number of podium finishes?
3. Which driver has the highest number of pole positions?
4. What is the average number of race wins per driver?
5. Which drivers have the highest win rates?
6. How does the distribution of championships won vary by nationality?
7. Are there any correlations between nationality and performance metrics like race wins or podium finishes?
8. How does the distribution of drivers by nationality change over the decades?
9. How many seasons, on average, do drivers compete in Formula 1?
10. Are there drivers who have competed for a significantly longer period than others?
11. What is the distribution of drivers based on the number of seasons they have participated in?
12. What is the distribution of race starts among drivers?
13. What is the average number of race starts per driver?
14. How many championships have been won by each driver?
15. How many drivers have won multiple championships?
16. Is there any correlation between the number of championship wins and other performance metrics like race wins or podium finishes?
17. What is the distribution of points earned among drivers?
18. Which driver has the highest number of fastest laps?
19. Is there any correlation between fastest laps and other performance metrics?
20. Was there any trend in the average points earned by drivers over different decades? Did any specific decade have a particularly high number of unique race winners or podium drivers?
21. How do different nationalities compare in terms of total race wins, podium finishes, championships, and points?
22. How do different drivers compare in terms of performance metrics?
23. How does the win rate change over time?
24. How do the statistics (race wins, podiums, etc.) differ between active and retired drivers? Are there any notable differences in the performance metrics between active and retired drivers?
25. How has the average points per race start evolved across different decades

## Key Findings

- The highest number of race wins: Lewis Hamilton (103 wins).
- The highest number of championship titles: 7 (Lewis Hamilton, Michael Schumacher).
- The most successful country in terms of championship titles is Great Britain, with a total of 20 titles.
- Only 17 out of 868 drivers have won more than one championship title - it's less than 2%.
- On average, a driver competes in Formula 1 for approximately 3 seasons. The highest number of seasons in which a driver has participated is 19. The majority of drivers - over 1/3 of all of them - participated in only one season.
- The average number of race starts per driver is 28 - which currently would be more than one season.
- As many as 87 drivers did not compete in any race, despite being on the entry lists.
- Nearly 60% of all drivers did not score any points throughout their careers.
- The average number of points scored per driver has declined in each successive decade - probably due to the increased number of races per season and changes in scoring rules.
- Although the 2020s included fewer seasons than others, the total number of points scored exceeded all decades except 2010s.
- Over the decades, the countries of origin of drivers have changed. In the 1950s and 1960s, there were many drivers from the United States (79 in the 1960s), while today there are only 1-2 drivers from the US per decade. Similarly, in the 1960s, 1970s, and 1980s, there were drivers from South Africa, however, there is currently no driver from that country on the grid.

## Limitations

Due to some differences in how the races took place over the years, it is impossible to clearly compare drivers from different decades to determine the best racers in history.

- Seasons consisted of different number of races. In the past some (mainly in 1950' and in the first part of 1960') seasons had less than 10 races total, while in 2010' there were usually more than 20 races each season.
- Over the years in Formula 1, different rules regarding points allocation were in place - the number of points awarded and the number of points-scoring positions in a race were changed.
- The 2020 decade covers only 2020 and 2021, making direct comparisons with other decades difficult.
- Drivers active in multiple decades have only one decade listed in their column (the one in which their debut occurred), and it is impossible to determine all the decades in which they raced from the data provided.
- The data for the 2023 season is incomplete, with only Piastri and Sargeant having race entries listed in this season. However, results from that year are not included for neither driver.
- Not all drivers completed entire seasons, e.g. Nyck de Vries or Nico Hulkenberg in 2022, who only replaced sick or injured drivers.
