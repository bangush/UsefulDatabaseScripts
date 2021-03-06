SELECT DISTINCT
     KU.TABLE_NAME, KU.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC 
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU
    ON TC.CONSTRAINT_TYPE = 'PRIMARY KEY' 
    AND TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME 
    AND KU.TABLE_NAME IN (#TABLE_NAME#)
ORDER BY KU.TABLE_NAME;
