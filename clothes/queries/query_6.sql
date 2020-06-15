SELECT fio FROM zakazchik as z WHERE EXISTS (SELECT * FROM izdelie WHERE cost > 3000 AND idz = z.idz)

-- взять людей у которых существуют покупки стоимостью больше 3000 рублей
