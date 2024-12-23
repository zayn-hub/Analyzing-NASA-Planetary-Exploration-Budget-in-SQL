
-- Analyzing NASA Planetary Exploratory Budgets

SELECT *
FROM 
INFLATION I ;

SELECT *
FROM 
MISSION_BUDGETS MB ;

SELECT *
FROM 
MISSION_DETAILS MD ;



-- Task 1 : Calculate the total cost of all missions over all time

SELECT 
SUM ("cost_MUSD") as total_cost_MUSD
FROM 
MISSION_BUDGETS MB ;

-- Task 2: Calculate the total cost of all missions over all time, adjusted for inflation

SELECT 
SUM("cost_MUSD" * INFLATION_ADJUSTMENT) as adjusted_total_cost_MUSD
FROM 
MISSION_BUDGETS MB 
left join INFLATION I 
on MB.FISCAL_YEAR::text = I.FISCAL_YEAR::TEXT;


-- Task 3: Get the mission with highest total cost

select mission, 
SUM("cost_MUSD" * INFLATION_ADJUSTMENT) as adjusted_total_cost_MUSD
FROM 
MISSION_BUDGETS MB 
left join INFLATION I 
on MB.FISCAL_YEAR::text = I.FISCAL_YEAR::text
group by mission
order by adjusted_total_cost_MUSD DESC ;


-- Task 4 : Calculate the inflation adjusted total cost per year

select MB.FISCAL_YEAR, 
SUM("cost_MUSD" * INFLATION_ADJUSTMENT) as adjusted_total_cost_MUSD
FROM 
MISSION_BUDGETS MB 
left join INFLATION I 
on MB.FISCAL_YEAR::text = I.FISCAL_YEAR::text
group by MB.FISCAL_YEAR 
order by MB.FISCAL_YEAR;


-- Task 5: Calculate the inflation adjusted total cost per destination

SELECT destination, SUM ("cost_MUSD"*inflation_adjustment) AS adjusted_total_cost_MUSD
FROM MISSION_BUDGETS MB 
LEFT JOIN INFLATION I 
ON MB.FISCAL_YEAR::text = I.FISCAL_YEAR::text
LEFT join MISSION_DETAILS MD 
using (MISSION)
GROUP BY destination
ORDER BY adjusted_total_cost_MUSD DESC ;


-- Task 6 : Calculate the inflation adjusted total cost per year per destination

SELECT MB.fiscal_year, destination, SUM("cost_MUSD"*inflation_adjustment) as adjusted_total_cost_MUSD
from MISSION_BUDGETS MB 
left join INFLATION I 
on MB.FISCAL_YEAR::text = I.FISCAL_YEAR::text 
left join MISSION_DETAILS MD 
using (mission)
group by MB.FISCAL_YEAR ,destination
order by MB.FISCAL_YEAR , destination;



