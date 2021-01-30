SELECT DISTINCT athletes.name, athletes.team_id, teams.id from athletes, teams
WHERE teams.noc = 'USA' and athletes.team_id = teams.id;

SELECT athletes.team_id, teams.id, teams.noc, COUNT(athletes.medal) 
FROM athletes, teams
WHERE athletes.team_id = teams.id AND medal = 'Gold'
GROUP BY teams.noc
ORDER BY COUNT(athletes.medal) DESC;



SELECT noc,COUNT(medal) 
FROM results 
JOIN nocs ON results.noc_id = nocs.id WHERE medal = 'Gold' 
GROUP BY nocs.noc 
ORDER BY COUNT(MEDAL) DESC;