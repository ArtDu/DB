SELECT id_teacher, COUNT(id_subject) as cnt FROM exams GROUP BY id_teacher INTO CURSOR _teachers
SELECT id_teacher, cnt FROM _teachers WHERE cnt = (select MAX(cnt) FROM tmp) INTO CURSOR _teachers
SELECT name, cnt FROM _teachers, teachers WHERE _teachers.id_teacher = teachers.id_teacher
