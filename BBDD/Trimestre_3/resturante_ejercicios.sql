DELIMITER &&
CREATE OR REPLACE FUNCTION insertar_tramo_horario(
    hora_inicio TIME, dia_semana VARCHAR(1)
) 
RETURNS VARCHAR(50)
BEGIN

    DECLARE hora_test_24 INT(2);
    DECLARE minuto_test_00 INT(2);
    DECLARE minuto_test_30 INT(2);
    DECLARE segundo_test_00 INT(2);
    DECLARE msg_error_hora VARCHAR(50) DEFAULT 'Formato horario no válido';
    DECLARE msg_error_fecha VARCHAR(50) DEFAULT 'Día de la semana no válido';

    SELECT HOUR(hora_inicio) INTO hora_test_24;
    SELECT MINUTE(hora_inicio) INTO minuto_test_00;
    SELECT MINUTE(hora_inicio) INTO minuto_test_30;
    SELECT SECONDS(hora_inicio) INTO segundo_test_00;

    SELECT INTO tramo_horario_comprobacion 

    -- Comprobar el formato de la hora
    IF hora_test_24 < 24 AND minuto_test_00 == 0 OR minuto_test_30 == 30 AND segundo_test_00 == 0 THEN
        -- Comprobar el formato de la semana
        IF dia_semana == 'L' OR 'M' OR 'X' OR 'J' OR 'V' OR 'S' OR 'D'THEN

        END IF;
        RETURN msg_error_fecha;
    END IF;
    RETURN msg_error_hora;

END;
&&
DELIMITER