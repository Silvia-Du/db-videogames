--(12) Selezionare la software house che ha vinto più premi tra il 2015 e il 2016 (software house id : 1)
SELECT TOP 1 COUNT(awards.id) as aw_count, software_house_id
FROM awards
INNER JOIN award_videogame
ON awards.id = award_videogame.award_id
INNER JOIN videogames
ON videogames.id = award_videogame.videogame_id
WHERE award_videogame.year between 2015 and 2016
GROUP BY software_house_id
ORDER BY aw_count DESC;


--(11) Selezionare i dati del videogame (id, name, release_date, totale recensioni) con più recensioni (videogame id : 398)
SELECT DISTINCT TOP 1 COUNT(videogame_id) as rev_count, videogame_id
FROM reviews 
INNER JOIN videogames
ON videogames.id = reviews.videogame_id
GROUP BY videogame_id
ORDER BY rev_count DESC;


--(10) Selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)
SELECT TOP 1 software_houses.*
FROM software_houses
INNER JOIN videogames
ON software_houses.id = videogames.software_house_id
ORDER BY videogames.release_date;

--*********** BONUS ***********

--(9) Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)
SELECT players.name, players.nickname
FROM players
INNER JOIN player_tournament
ON players.id = player_tournament.player_id
INNER JOIN tournaments
ON tournaments.id = player_tournament.tournament_id
INNER JOIN tournament_videogame
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON videogames.id = award_videogame.videogame_id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE awards.id = 5 AND award_videogame.year = 2018 AND tournaments.year = 2019;


--(8) Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)
SELECT tournaments.city
FROM tournaments
INNER JOIN tournament_videogame
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON videogames.id = award_videogame.videogame_id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE awards.id = 1 AND award_videogame.year = 2018;

--(7) Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)
SELECT DISTINCT videogames.id
FROM videogames
INNER JOIN tournament_videogame
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN tournaments
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN player_tournament
ON tournaments.id = player_tournament.tournament_id
INNER JOIN players
ON players.id = player_tournament.player_id
WHERE players.name like 'S%';


--(6) Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)
SELECT DISTINCT videogames.id as videogame_id,categories.name as category_name,  pegi_label_id
FROM videogames

INNER JOIN category_videogame
ON videogames.id = category_videogame.videogame_id
INNER JOIN categories
ON categories.id = category_videogame.category_id

INNER JOIN pegi_label_videogame
ON videogames.id = pegi_label_videogame.videogame_id
INNER JOIN reviews
ON videogames.id = reviews.videogame_id
WHERE rating >=4 AND rating <=5;


--(5) Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
SELECT awards.name, videogames.name, software_house_id
FROM awards
INNER JOIN award_videogame
ON awards.id = award_videogame.award_id
INNER JOIN videogames
ON videogames.id = award_videogame.videogame_id
ORDER BY videogames.software_house_id;

--(4) Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
SELECT DISTINCT software_houses.id
FROM software_houses
INNER JOIN videogames
ON software_houses.id = videogames.software_house_id
WHERE year(release_date) > 2020;


--(3) Mostrare le categorie di ogni videogioco (1718)
SELECT DISTINCT videogames.id as videogame_id, categories.name
FROM videogames
INNER JOIN category_videogame
ON videogames.id = category_videogame.videogame_id
INNER JOIN categories
ON categories.id = category_videogame.category_id;


--(2) Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
SELECT DISTINCT videogames.id, videogames.name
FROM videogames
INNER JOIN tournament_videogame
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN tournaments
ON tournaments.id = tournament_videogame.tournament_id
WHERE year = 2016;

--(1) Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
SELECT DISTINCT players.* 
FROM players
INNER JOIN reviews
ON players.id = reviews.player_id;