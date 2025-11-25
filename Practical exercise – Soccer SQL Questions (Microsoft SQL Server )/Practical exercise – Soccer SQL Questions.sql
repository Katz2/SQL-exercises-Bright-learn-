-- 1. View the first 100 rows
SELECT * FROM soccer_players LIMIT 100;

-- 2. Count total number of players
SELECT COUNT(*) AS total_players FROM soccer_players;

-- 3. List all unique teams
SELECT DISTINCT team FROM soccer_players;

-- 4. Count players per team
SELECT team, COUNT(*) AS total_players
FROM soccer_players
GROUP BY team;

-- 5. Top 10 players with most goals
SELECT player_name, team, goals
FROM soccer_players
ORDER BY goals DESC
LIMIT 10;

-- 6. Average salary for players in each team
SELECT team, AVG(average_salary_zar) AS avg_salary
FROM soccer_players
GROUP BY team;

-- 7. Top 10 highest market value players
SELECT player_name, team, market_value_zar
FROM soccer_players
ORDER BY market_value_zar DESC
LIMIT 10;

-- 8. Average passing accuracy by position
SELECT position, AVG(passing_accuracy) AS avg_passing_accuracy
FROM soccer_players
GROUP BY position;

-- 9. Compare shot accuracy with goals
SELECT player_name, goals, shot_accuracy
FROM soccer_players
ORDER BY shot_accuracy DESC;

-- 10. Total goals & assists for each team
SELECT team,
       SUM(goals) AS total_goals,
       SUM(assists) AS total_assists
FROM soccer_players
GROUP BY team;

-- 11. Count players by marital status
SELECT marital_status, COUNT(*) AS total_players
FROM soccer_players
GROUP BY marital_status;

-- 12. Count players by nationality
SELECT nationality, COUNT(*) AS total_players
FROM soccer_players
GROUP BY nationality;

-- 13. Average market value by nationality
SELECT nationality, AVG(market_value_zar) AS avg_market_value
FROM soccer_players
GROUP BY nationality;

-- 14. Number of contracts ending each year
SELECT contract_end_year, COUNT(*) AS contracts_expiring
FROM soccer_players
GROUP BY contract_end_year
ORDER BY contract_end_year;

-- 15. Contracts ending next year
SELECT player_name, team, contract_end_year
FROM soccer_players
WHERE contract_end_year = YEAR(CURDATE()) + 1;

-- 16. Players by injury status
SELECT injury_status, COUNT(*) AS total_players
FROM soccer_players
GROUP BY injury_status;

-- 17. Goals per match ratio
SELECT player_name,
       team,
       goals,
       matches_played,
       (goals / matches_played) AS goals_per_match
FROM soccer_players;

-- 18. Players managed by each agent
SELECT agent, COUNT(*) AS total_players
FROM soccer_players
GROUP BY agent;

-- 19. Average height & weight by position
SELECT position,
       AVG(height_cm) AS avg_height,
       AVG(weight_kg) AS avg_weight
FROM soccer_players
GROUP BY position;

-- 20. Highest combined goals + assists
SELECT player_name,
       team,
       goals,
       assists,
       (goals + assists) AS total_contribution
FROM soccer_players
ORDER BY total_contribution DESC
LIMIT 10;
