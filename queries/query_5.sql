SELECT id_exam, AVG(mark) as _avg FROM marks_list GROUP BY id_exam WHERE id_exam=39 INTO cursor _marks
SELECT exams.id_group, exams.id_exam, _avg FROM exams, _marks WHERE exams.id_exam = _marks.id_exam
SELECT exams.id_group, exams.id_exam, _avg FROM exams, _marks WHERE exams.id_exam = _marks.id_exam INTO CURSOR _tmp
