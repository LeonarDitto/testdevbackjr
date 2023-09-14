-- Depurar solo los ID diferentes de 6, 7, 9 y 10 de la tabla usuarios
DELETE FROM usuario
WHERE userId NOT IN ('user06', 'user07', 'user09', 'user10');

-- Actualizar el dato Sueldo en un 10 porciento a los empleados que tienen fechas entre el año 2000 y 2001:
UPDATE empleado
SET sueldo = sueldo * 1.10
WHERE YEAR(fechaIngreso) BETWEEN 2000 AND 2001;

-- Realiza una consulta para traer el nombre de usuario y fecha de ingreso de los usuarios que ganan más de 10000 y su apellido comience con T, ordenados del más reciente al más antiguo:
SELECT nombre, fechaIngreso
FROM usuario AS u
INNER JOIN empleado AS e ON u.userId = e.userId
WHERE e.sueldo > 10000 AND paterno LIKE 'T%'
ORDER BY fechaIngreso DESC;

-- Realiza una consulta donde agrupes a los empleados por sueldo, un grupo con los que ganan menos de 1200 y uno mayor o igual a 1200, y cuentes cuántos hay en cada grupo:
SELECT
    CASE
        WHEN sueldo < 1200 THEN 'Menor a 1200'
        ELSE 'Mayor o igual a 1200'
    END AS GrupoSueldo,
    COUNT(*) AS CantidadEmpleados
FROM empleado
GROUP BY
    CASE
        WHEN sueldo < 1200 THEN 'Menor a 1200'
        ELSE 'Mayor o igual a 1200'
    END;

SELECT
    CASE
        WHEN e.sueldo < 1200 THEN 'Menor a 1200'
        ELSE 'Mayor o igual a 1200'
    END AS GrupoSueldo,
    GROUP_CONCAT(u.nombre ORDER BY u.nombre ASC) AS EmpleadosEnGrupo
FROM empleado AS e
INNER JOIN usuario AS u ON e.userId = u.userId
GROUP BY
    CASE
        WHEN e.Sueldo < 1200 THEN 'Menor a 1200'
        ELSE 'Mayor o igual a 1200'
    END;