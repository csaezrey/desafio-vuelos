

--Obtenemos la totalidad de los vuelos por aerolínea. Basta con contar agrupando por aerolínea.
-- Al contrastar la data se aprecia que la diferencia en el número de vuelos entre las aerolíneas es poco
SELECT Aerolinea, count(1) FROM vw_vuelos GROUP BY 1 ORDER BY 2 DESC;

-- Similar al anterior, basta con contar agrupando por origen.
-- En este caso, los vuelos desde SAP son más del doble de quien lo sigue.
SELECT Origen, count(1) FROM vw_vuelos GROUP BY 1 ORDER BY 2 DESC;

--Se le agrega el filtro por aerolínea 8.
-- La aerolínea 8 vuela principalmente desde SAP.
SELECT Origen, count(1) FROM vw_vuelos WHERE Aerolinea = 8 GROUP BY 1 ORDER BY 2 DESC;

--Se cambia el filtro para la aerolínea 4
-- La aerolínea 4 (igual que la 8) vuela principalmente desde SAP.
SELECT Destino, count(1) FROM vw_vuelos WHERE Aerolinea = 4 GROUP BY 1 ORDER BY 2 DESC;

--Se cuenta agrupando por piloto.
--El piloto con más vuelos (Jonh Pierson) posee muchos más vuelos que el resto de los pilotos.
SELECT p.Piloto, v.`Codigo Piloto`, count(1) 
FROM vw_vuelos v
LEFT JOIN vw_pilotos p ON p.`Codigo Piloto` = v.`Codigo Piloto`
GROUP BY 1, 2 
ORDER BY 3 DESC;