SELECT id_classroom, COUNT(id_classroom) as cnt FROM Exams GROUP BY id_classroom WHERE (year(Data) = 2019 AND month(Data) >= 9) OR (year(Data) = 2020 AND month(Data) <2) INTO CURSOR tmp
SELECT id_classroom, cnt FROM tmp WHERE cnt = (SELECT MAX(cnt) FROM tmp)
