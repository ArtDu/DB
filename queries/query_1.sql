-- Берем id предмета
SELECT subjects.id_subject, subjects.name, exams.id_subject, exams.id_exam FROM subjects, exams WHERE name = 'Algorithms' AND subjects.id_subject = exams.id_subject INTO CURSOR exam
-- Берем id студентов у которых оценка 5 за предмет ...
SELECT marks_list.id_student, marks_list.mark, marks_list.id_exam, exam.id_exam, exam.name as exam_name FROM marks_list, exam WHERE marks_list.id_exam = exam.id_exam AND mark = 5 INTO CURSOR marks
-- Берем номер группы у студентов и их имена
SELECT students.name, marks.id_exam_a, students.id_group, marks.exam_name FROM students, marks WHERE students.id_student = marks.id_student INTO CURSOR _students
-- Берем пару студентов с разными именами
SELECT a.name, b.name, a.exam_name, a.id_group FROM _students as a, _students as b WHERE a.name < b.name AND a.id_group = b.id_group 
