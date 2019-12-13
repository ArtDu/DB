SELECT id_group FROM groups as a WHERE EXISTS (SELECT * FROM students WHERE year(birth) >= 2000 AND id_group = a.id_group)

-- взять группы в которых люди родились в 21 веке
