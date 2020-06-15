
-- Берем id_faculty
SELECT id_faculty
  FROM faculties
  WHERE faculties.name = '«Информационные технологии и прикладная математика»'
  INTO CURSOR _faculty
-- Берем id_department
SELECT departments.id_department
  FROM departments, _faculty
  WHERE departments.id_faculty = _faculty.id_faculty
  INTO CURSOR _departments
-- Берем id_group(все группы факультета)
SELECT groups.id_group
  FROM groups, _departments
  WHERE groups.id_department = _departments.id_department
  INTO CURSOR _groups
-- берем id_student'ов заданного факультета и их id_group
SELECT students.id_student, students.id_group
  FROM students, _groups
  WHERE _groups.id_group = students.id_group
  INTO CURSOR _students


-- берем id_subject по выбранному предмету
SELECT id_subject, name
  FROM subjects
  WHERE name = 'Algorithms'
  INTO CURSOR _subject
-- берем id_exam по выбранному предмету у групп выбранного факультета
SELECT exams.id_exam, _subject.name
  FROM exams, _subject, _groups
  WHERE _subject.id_subject = exams.id_subject AND exams.id_group = _groups.id_group
  INTO CURSOR _exam

-- Берем оценки групп факультета
SELECT _students.id_group, marks_list.mark
  FROM marks_list, _students, _exam
  WHERE _students.id_student = marks_list.id_student AND marks_list.id_exam = _exam.id_exam
  INTO CURSOR _groups_subj

-- Берем среднюю оценку у каждой группы
SELECT id_group, AVG(mark) as _avg
  FROM _groups_subj
  GROUP BY id_group
  INTO cursor _marks
-- Берем группы у которых средняя оценка выше средней на факультете
SELECT id_group
  FROM _marks
  WHERE _avg > (SELECT AVG(_avg) FROM _marks)
