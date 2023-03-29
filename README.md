# Cursor and While - MySQL
Working with cursor and while (loop) in MySQL

![label](https://img.shields.io/badge/Language-SQL%20(MySQL)-brightgreen)

### About
Different of PLSQL, in MySQL you can use cursors only inside stored procedures. The structure of the statements are different too, here you must open the cursor and declare variables to FETCH the values retrieved. Instead of using the FOR LOOP statement like plsql, you must use WHILE...DO and declare one variable to exit the while loop process.

### Using Cursor/While in MySQL

The syntax of this method using Cursor,While,Do statements is as follows:

- Update:
```
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
```

- Insert:

```
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
```

### Understanding the syntax