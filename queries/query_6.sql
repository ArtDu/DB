SELECT * FROM departments as a WHERE EXISTS (SELECT * FROM teachers WHERE degree = 'профессор' AND id_department = a.id_department)

-- взять кафедры в которой существуют преподаватели со степенью Профессора 
