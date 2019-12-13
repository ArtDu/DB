SELECT subjects.id_subject, subjects.name, exams.id_subject, exams.id_exam FROM subjects, exams WHERE subjects.name = 'Algorithms' AND subjects.id_subject = exams.id_subject INTO CURSOR _exam

SELECT _exam.id_exam, classrooms.id_classroom, classrooms.classroom FROM _exam, exams, classrooms WHERE _exam.id_exam = exams.id_exam AND exams.id_classroom = classrooms.id_classroom INTO CURSOR ans
SELECT DISTINCT classroom FROM ans
