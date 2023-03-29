---Cursor MySQL Example UPDATE:

CREATE PROCEDURE procedure_name ()
BEGIN
DECLARE end int default 0;
DECLARE variable1, variable2, variable3 varchar(50);
DECLARE C CURSOR FOR
SELECT field1, field2, field3 FROM table;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET end = 1;
OPEN C;
WHILE end = 0 DO
FETCH C INTO variable1, variable2, variable3;
IF end = 0 THEN	
UPDATE table2 SET field4 = variable1, field5 = variable2
WHERE field6 = variable3;
END IF;
END WHILE;	
CLOSE C;
END

---Cursor MySQL Example INSERT:

CREATE PROCEDURE procedure_name ()
BEGIN
DECLARE end int default 0;
DECLARE variable1, variable2, variable3 varchar(50);
DECLARE C CURSOR FOR
SELECT field1, field2, field3 FROM table;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET end = 1;
OPEN C;
WHILE end = 0 DO
FETCH C INTO variable1, variable2, variable3;
IF end = 0 THEN	
INSERT INTO table2
(field4, field5, field6)
VALUES
(variable1,variable2,variable3)
END IF;
END WHILE;	
CLOSE C;
END