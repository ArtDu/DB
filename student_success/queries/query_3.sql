SELECT id_classroom, COUNT(id_classroom) as cnt
  FROM Exams
  GROUP BY id_classroom
  WHERE (year(Data) = 2019 AND month(Data) >= 9) OR (year(Data) = 2020 AND month(Data) <2)
  INTO CURSOR tmp

SELECT classrooms.classroom, tmp.cnt
  FROM tmp, classrooms
  WHERE tmp.cnt = (SELECT MAX(cnt) FROM tmp) AND tmp.id_classroom = classrooms.id_classroom
