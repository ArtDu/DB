
SELECT DISTINCT idma
FROM izdelie
WHERE cost > (SELECT AVG(cost) FROM izdelie)
INTO CURSOR _id_master

SELECT fio
FROM _id_master, master AS m
WHERE m.idma = _id_master.idma
