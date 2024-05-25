CREATE TABLE players (
    RANK INTEGER NULL,           -- Player's ranking
    NAME TEXT NULL,              -- Player's name
    TEAM TEXT NULL,              -- Player's team
    POS TEXT NULL,               -- Player's position
    AGE REAL NULL,               -- Player's age
    GP INTEGER NULL,             -- Games played
    MPG REAL NULL,               -- Minutes per game
    USG REAL NULL,               -- Usage rate
    TO_PERCENT REAL NULL,        -- Turnover percentage
    FTA INTEGER NULL,            -- Free throws attempted
    FT_PERCENT REAL NULL,        -- Free throw percentage
    TWO_PA INTEGER NULL,         -- Two-point attempts
    TWO_P_PERCENT REAL NULL,     -- Two-point percentage
    THREE_PA INTEGER NULL,       -- Three-point attempts
    THREE_P_PERCENT REAL NULL,   -- Three-point percentage
    eFG_PERCENT REAL NULL,       -- Effective field goal percentage
    TS_PERCENT REAL NULL,        -- True shooting percentage
    PPG REAL NULL,               -- Points per game
    RPG REAL NULL,               -- Rebounds per game
    APG REAL NULL,               -- Assists per game
    SPG REAL NULL,               -- Steals per game
    BPG REAL NULL,               -- Blocks per game
    TPG REAL NULL,               -- Turnovers per game
    P_PLUS_R REAL NULL,          -- Points plus rebounds
    P_PLUS_A REAL NULL,          -- Points plus assists
    P_PLUS_R_PLUS_A REAL NULL,   -- Points plus rebounds plus assists
    VI REAL NULL,                -- Versatility index
    ORtg REAL NULL,              -- Offensive rating
    DRtg REAL NULL               -- Defensive rating
);

.mode csv
.import nba.csv players

ALTER TABLE players DROP COLUMN RANK;   
    
-- Here are some examples of queries you can execute on the "players" table to gain insights into NBA players' data:
   
-- Get all players from a specific team:
SELECT * 
FROM players 
WHERE TEAM = 'Team_Name';

-- Find the top five players with the highest points per game (PPG):
SELECT * 
FROM players 
WHERE TEAM IN (SELECT DISTINCT TEAM FROM players) 
ORDER BY PPG 
DESC LIMIT 5;

-- Calculate the average age of players:
SELECT AVG(AGE) AS AVG_AGE 
FROM players;

-- Find the youngest player:
SELECT * 
FROM players 
WHERE AGE = (SELECT MIN(AGE) FROM players);

-- Count the number of players in each position (POS):
SELECT POS, COUNT(DISTINCT NAME) AS NUM_PLAYERS 
FROM players 
GROUP BY POS;

-- Find players with the highest average minutes per game (MPG):
SELECT * 
FROM players 
WHERE TEAM IN (SELECT DISTINCT TEAM FROM players) 
ORDER BY MPG DESC LIMIT 5;

-- Calculate the average points per game (PPG) per team:
SELECT TEAM, AVG(PPG) AS AVG_PPG 
FROM players 
GROUP BY TEAM;

-- Find players with the highest three-point shooting percentage (THREE_P_PERCENT):
SELECT * 
FROM players 
WHERE TEAM IN (SELECT DISTINCT TEAM FROM players)
ORDER BY THREE_P_PERCENT DESC LIMIT 5;

