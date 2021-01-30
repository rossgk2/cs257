SELECT DISTINCT athletes.name, athletes.team_id, teams.id from athletes, teams
WHERE teams.noc = 'USA' and athletes.team_id = teams.id;

