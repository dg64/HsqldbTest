To start the server run runServer.sh

To start the database manager run runDatabaseManager.sh


/*
	Sample stored procedure in HSQLDB

	The stored procedure updates two rows in table_02,
	summing the values from table_01, parameter
	in input is also written in table_02
	To execute the stored procedure type

	CALL PUBLIC.Test('prova');
*/


CREATE TABLE PUBLIC.Table_01 (
	idTable_01	INTEGER IDENTITY,
	Name		VARCHAR(50) NOT NULL,
	Value		INTEGER	NOT NULL
)


CREATE TABLE PUBLIC.Table_02 (
	idTable_02 INTEGER IDENTITY,
	Description VARCHAR(50) NOT NULL,
	Value INTEGER NOT NULL,
	ExecutionTime TIMESTAMP NOT NULL
)


INSERT INTO PUBLIC.Table_01(Name,Value) VALUES('A', 100);
INSERT INTO PUBLIC.Table_01(Name,Value) VALUES('B', 620);
INSERT INTO PUBLIC.Table_01(Name,Value) VALUES('C', 470);
INSERT INTO PUBLIC.Table_01(Name,Value) VALUES('D', 240);
INSERT INTO PUBLIC.Table_01(Name,Value) VALUES('E', 300);
INSERT INTO PUBLIC.Table_01(Name,Value) VALUES('F', 40);
INSERT INTO PUBLIC.Table_01(Name,Value) VALUES('G', 850);


CREATE PROCEDURE PUBLIC.Test(IN param1 VARCHAR(50)) MODIFIES SQL DATA
BEGIN ATOMIC
	DECLARE varDate		TIMESTAMP;
    DECLARE varSum		INTEGER;
    DECLARE varTmpSum	INTEGER;

	SET varDate = CURRENT_TIMESTAMP;

	SET varSum = SELECT SUM(Value)
		FROM PUBLIC.Table_01
		WHERE Name <= 'C';

	INSERT INTO
		PUBLIC.Table_02(Description, Value, ExecutionTime)
	VALUES(
		param1, varSum, varDate
        );

 	SET varSum = 0;
	for_label: FOR SELECT Value FROM PUBLIC.Table_01 DO
		SET varSum =  varSum + Value;
	END FOR for_label;

	INSERT INTO
		PUBLIC.Table_02(Description, Value, ExecutionTime)
	VALUES(
		param1, varSum, varDate
        );

END
