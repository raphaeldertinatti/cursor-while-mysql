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

```
DECLARE end int default 0;
DECLARE variable1, variable2, variable3 varchar(50);
DECLARE C CURSOR FOR
SELECT field1, field2, field3 FROM table;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET end = 1;
```

The `end` variable starts with 0 and will indicate that the while-loop should exit when this variable receive 1.

The `variables 1,2,3` in this example, are declared as varchar, but must be declared as the same datatypes from the cursor fields that will be fetched. These variables will receive data from the cursor during the loop with the FETCH statement.

After the normal cursor declaration, we have the `CONTINUE HANDLER` declaration, it will specifies a handler to be executed when the cursor reaches the end of the result set. The handler sets the value of `end` variable to 1, and the loop will stop.

```
OPEN C;
WHILE end = 0 DO
FETCH C INTO variable1, variable2, variable3;
IF end = 0 THEN	
UPDATE table2 SET field4 = variable1, field5 = variable2
WHERE field6 = variable3;
END IF;
END WHILE;	
CLOSE C;
```

Before the loop starts, we open the cursor with `OPEN C` statement, then whe start the `WHILE` with the condition **end = 0**. Inside the while loop, the cursor data will be fetched into the declared variables, and then the update or insert operation will use the fetched data.

### Conclusion

This is the method that i use in MySQL when i must work with Cursors, as you can see, it is very different for the plsql statements about cursors and loops. 

