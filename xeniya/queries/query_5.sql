SELECT i.idi, i.name, i.idz FROM izdelie AS i WHERE i.name = "Рубашка" INTO CURSOR _items

SELECT idz FROM zakazchik WHERE fio = "Дубинин Артем Олегович" INTO CURSOR _client

SELECT i.idi FROM _client AS c, _items AS i WHERE c.idz = i.idz INTO CURSOR _idi_client

SELECT f.idf, f.name FROM rash_furniture AS rf, _idi_client, furniture AS f WHERE rf.idi = _idi_client.idi AND rf.idf = f.idf INTO CURSOR _furniture

SELECT rf.idi FROM _furniture AS f, rash_furniture AS rf, _idi_client AS c WHERE f.idf = rf.idf AND c.idi <> rf.idi INTO CURSOR _people

SELECT z.fio FROM _items AS i, zakazchik AS z, _people AS ppl WHERE i.idz = z.idz AND ppl.idi = i.idi
