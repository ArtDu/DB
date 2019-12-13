-- Берем id_subject
SELECT subjects.id_subject, subjects.name, exams.id_subject, exams.id_exam
  FROM subjects, exams
  WHERE subjects.name = 'Algorithms' AND subjects.id_subject = exams.id_subject
  INTO CURSOR _exam
-- Берем id студентов у которых оценка 5 за предмет
SELECT marks_list.id_student, marks_list.mark, _exam.id_exam, _exam.name as exam_name
  FROM marks_list, _exam
  WHERE marks_list.id_exam = _exam.id_exam AND mark = 5
  INTO CURSOR _marks
-- Берем номер группы у студентов и их имена
SELECT students.name, marks.id_exam, students.id_group, _marks.exam_name
  FROM students, _marks
  WHERE students.id_student = _marks.id_student
  INTO CURSOR _students
-- Берем пару студентов с разными именами
SELECT a.name, b.name, a.exam_name, a.id_group
  FROM _students as a, _students as b
  WHERE a.name < b.name AND a.id_group = b.id_group
