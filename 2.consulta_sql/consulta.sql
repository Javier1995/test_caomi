
/* c_contactos
IdContacto
NombreContacto
TelefonoContacto

c_eventos
IdEvento
DescripcionEvento
LugarEvento
FechaHoraEvento

k_citas
IdCita
IdContacto
IdEvento
NotaCita
EstadoCancelarCita */



---Insertar, Actualizar y Borrar un Contacto.
INSERT INTO c_eventos(DescripcionEvento, LugarEvento, FechaHoraEvento) VALUES('Fiesta','Centro, Tabasco','11-19-2021');

UPDATE c_eventos SET DescripcionEvento = 'updateDescription', LugarEvento = 'Updatelugar', FechaHoraEvento = '11-19-2022';

DELETE FROM c_eventos WHERE IdCita = 1;

--Insertar, Actualizar y Borrar una Cita.

INSERT INTO k_citas(IdContacto, IdEvento, NotaCita, EstadoCancelarCita) VALUES(1,1, 'Tabasco','11-19-2021');

UPDATE c_eventos SET DescripcionEvento = 'updateDescription', LugarEvento = 'Updatelugar', FechaHoraEvento = '11-19-2022' WHERE IdEvento = 1; 

DELETE FROM c_eventos WHERE IdEvento = 1;

--Consultar todas las citas que se den en México.
SELECT  * FROM k_citas kc 
INNER JOIN c_eventos ce ON  kc.idEvento = ce.idEvento
INNER JOIN c_contactos cc ON kc.IdContacto = cc.IdContacto
WHERE ce.LugarEvento = 'mexico' OR  ce.LugarEvento LIKE '%mexico%';


--Consultar todas citas de personas llamadas Luis.
SELECT  * FROM k_citas kc 
INNER JOIN c_eventos ce ON  kc.idEvento = ce.idEvento
INNER JOIN c_contactos cc ON kc.IdContacto = cc.IdContacto
WHERE cc.LugarEvento LIKE '%luis%';

--Consultar todas las citas de ayer.

SELECT  * FROM k_citas kc 
INNER JOIN c_eventos ce ON  kc.idEvento = ce.idEvento
INNER JOIN c_contactos cc ON kc.IdContacto = cc.IdContacto
WHERE ce.FechaHoraEvento = DATE_SUB(CONCAT(CURDATE(), ' 00:00:00'), INTERVAL 1 DAY);



--Consultar todas las citas que tengan alguna Nota.
SELECT  * FROM k_citas kc 
INNER JOIN c_eventos ce ON  kc.idEvento = ce.idEvento
INNER JOIN c_contactos cc ON kc.IdContacto = cc.IdContacto
WHERE kc.notaCita IS NOT NULL; 

--Borrar las citas de mañana.
DELETE kc.* FROM k_citas as kc 
INNER JOIN c_eventos as ce ON kc.idEvento = ce.idEvento
WHERE ce.FechaHoraEvento = DATE_SUB(CONCAT(CURDATE(), ' 00:00:00'), INTERVAL -1 DAY);

--Cancelar todas las citas de "Rosario Robles".
UPDATE k_citas kc 
INNER JOIN c_contactos cc ON kc.IdContacto = cc.IdContacto
SET kc.EstadoCancelarCita = 'Cancelado'
WHERE cc.NombreContacto = 'Rosario Robles';



