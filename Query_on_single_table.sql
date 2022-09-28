--(12) Selezionare il numero di videogame che la software house con ID = 1 ha rilasciato nel 2018 (13)
SELECT COUNT(id) as count_videogame
FROM videogames
WHERE software_house_id = 1 AND year(release_date) = 2018;

--(11) Selezionare il numero e la media delle recensioni per il videogioco con ID = 412 (review number = 12, avg_rating = 3)
SELECT COUNT(id) as reviwe_number , AVG(rating) as avg_rating
FROM reviews
WHERE videogame_id = 412;

--*********** BONUS ***********

--(10) Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da stelle 5, mostrandoli una sola volta (443)
SELECT videogame_id
FROM reviews
WHERE rating = 5
GROUP BY videogame_id;



--(9) Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)
SELECT *
FROM videogames
WHERE year(release_date) = 2020;


--(8) Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)
SELECT *
FROM reviews
WHERE rating >=2 AND rating <= 4;


--(7) Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)
SELECT videogame_id
FROM category_videogame
WHERE category_id = 2 OR category_id = 6
GROUP BY videogame_id;



--(6) Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)
SELECT *
FROM awards
WHERE description like '%facere%';

--(5) Contare quanti tornei ci sono stati nell'anno 2015 (9)
SELECT COUNT(ID) as total_tournaments
FROM tournaments
WHERE year = 2015;


--(4)selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)
SELECT *
FROM reviews
WHERE player_id = 800;


--(3) selezionare tutti i giocatori il cui nome finisce per "a" (220r)
SELECT *
FROM players
WHERE name Like '%a';


-- (2) Selezionare tutti i giocatori di Rogahnland (2r)
SELECT *
FROM players
WHERE city = 'Rogahnland';

-- (1) Selezionare tutte le software house americane (3r)
SELECT *
FROM software_houses
WHERE country = 'united states';