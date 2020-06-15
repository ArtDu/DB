-- берем id изделие по материалу
SELECT t.idi
FROM tissue_consumption AS t, mathereal AS m
WHERE m.name="Хлопок" AND t.idm = m.idm
INTO CURSOR _items
-- берем id Заказчика у этих изделий
SELECT i.idz FROM _items, izdelie AS i
WHERE i.idi = _items.idi
INTO CURSOR _clients

SELECT fio
FROM zakazchik
WHERE idz NOT IN(SELECT z.idz FROM _clients, zakazchik AS z WHERE _clients.idz = z.idz)
