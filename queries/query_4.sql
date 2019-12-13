SELECT id_teacher, COUNT(id_subject) as cnt FROM exams GROUP BY id_teacher INTO CURSOR _teachers
SELECT id_teacher, cnt FROM _teachers WHERE cnt = (select MAX(cnt) FROM _teachers) INTO CURSOR _ans
SELECT name, cnt FROM _ans, teachers WHERE _ans.id_teacher = teachers.id_teacher
