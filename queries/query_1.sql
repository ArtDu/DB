-- Берем id студентов у которых оценка 5 за предмет ...
SELECT id_student, mark, id_exam FROM marks_list WHERE id_exam = 28 AND mark = 5 INTO CURSOR marks
-- Берем номер группы у студентов и их имена
SELECT students.name, marks.id_exam, students.id_group FROM students, marks WHERE students.id_student = marks.id_student INTO CURSOR _students

SELECT a.name, b.name, a.id_exam, a.id_group FROM _students as a, _students as b WHERE a.name < b.name
