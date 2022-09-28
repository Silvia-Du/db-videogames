﻿--(6) Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)
SELECT COUNT(id) as count_tot, videogame_id, AVG(rating) as avg_rating
FROM reviews
GROUP BY videogame_id
ORDER BY AVG(rating);

--(5) Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)
SELECT COUNT(videogame_id) as count_videogame, device_id
FROM device_videogame
GROUP BY device_id;

--(4) Mostrare il numero di videogiochi rilasciati ogni anno (11)
SELECT COUNT(*) as count_videogames
FROM videogames
GROUP BY year(release_date);


--(3) Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)
SELECT COUNT(*) as count_tot, pegi_label_id
FROM pegi_label_videogame
GROUP BY pegi_label_id;


--(2) Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)
SELECT COUNT(id) as count_tot, videogame_id
FROM reviews
GROUP BY videogame_id;

--(1) Contare quante software house ci sono per ogni paese (3)
SELECT COUNT(id) as count_soft_house, country
FROM software_houses
GROUP BY country;