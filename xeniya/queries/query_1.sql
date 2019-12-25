SELECT z.fio, i.name FROM zakazchik AS z, izdelie AS i WHERE z.idz=i.idz INTO CURSOR _items
SELECT a.fio, b.fio, a.name FROM _items AS a, _items AS b WHERE a.name = b.name AND a.fio < b.fio
