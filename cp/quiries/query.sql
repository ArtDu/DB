-- Распечатать ведомость по выбранному предмету
SELECT id_subject FROM subjects WHERE name = "Algorithms" INTO CURSOR _subject
SELECT exams.id_exam FROM exams, _subject WHERE exams.id_subject = _subject.id_subject INTO CURSOR _exam
SELECT marks_list.id_student, marks_list.mark FROM marks_list, _exam WHERE marks_list.id_exam = _exam.id_exam INTO CURSOR _marks
SELECT students.name, _marks.mark FROM _marks, students WHERE _marks.id_student = students.id_student
-- Поиск студентов с двойкой
SELECT id_subject FROM subjects WHERE name = "Algorithms" INTO CURSOR _subject
SELECT exams.id_exam FROM exams, _subject WHERE exams.id_subject = _subject.id_subject AND ((year(Data) = 2019 AND month(Data) >= 9) OR (year(Data) = 2020 AND month(Data) <2)) INTO CURSOR _exam
SELECT marks_list.id_student, marks_list.mark FROM marks_list, _exam WHERE marks_list.id_exam = _exam.id_exam AND marks_list.mark = 2 INTO CURSOR _marks
SELECT students.name, _marks.mark FROM _marks, students WHERE _marks.id_student = students.id_student