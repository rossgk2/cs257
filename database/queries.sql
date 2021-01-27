SELECT teams.noc FROM teams ORDER BY teams.noc;

SELECT teams.teamname, athletes.name
FROM teams, athletes
WHERE teams.teamname = 'Kenya';

SELECT athletes.name, athletes.medal, games.year
FROM athletes, games
WHERE athletes.names = 'Greg Louganis'
ORDER BY games.year;

SELECT athletes.noc, SUM(athletes.medal),
FROM athletes
GROUP BY athletes.noc;