SELECT idz, SUM(cost) AS msum FROM izdelie AS i GROUP BY idz INTO CURSOR _groupby
SELECT idz, msum FROM _groupby WHERE msum = (SELECT MAX(msum) FROM _groupby ) INTO CURSOR _client
SELECT z.fio, _client.msum FROM _client, zakazchik AS z WHERE _client.idz = z.idz
