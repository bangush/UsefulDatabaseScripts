-- https://stackoverflow.com/questions/20699310/how-to-get-foreign-key-referenced-table-in-firebird
select 
 PK.RDB$RELATION_NAME as PKTABLE_NAME
,ISP.RDB$FIELD_NAME as PKCOLUMN_NAME
,FK.RDB$RELATION_NAME as FKTABLE_NAME
,ISF.RDB$FIELD_NAME as FKCOLUMN_NAME
-- ,(ISP.RDB$FIELD_POSITION + 1) as KEY_SEQ
-- ,RC.RDB$UPDATE_RULE as UPDATE_RULE
-- ,RC.RDB$DELETE_RULE as DELETE_RULE
,PK.RDB$CONSTRAINT_NAME as PK_NAME
,FK.RDB$CONSTRAINT_NAME as FK_NAME
from
 RDB$RELATION_CONSTRAINTS PK
,RDB$RELATION_CONSTRAINTS FK
,RDB$REF_CONSTRAINTS RC
,RDB$INDEX_SEGMENTS ISP
,RDB$INDEX_SEGMENTS ISF
WHERE -- FK.RDB$RELATION_NAME = ? and 
 FK.RDB$CONSTRAINT_NAME = RC.RDB$CONSTRAINT_NAME 
and PK.RDB$CONSTRAINT_NAME = RC.RDB$CONST_NAME_UQ 
and ISP.RDB$INDEX_NAME = PK.RDB$INDEX_NAME 
and ISF.RDB$INDEX_NAME = FK.RDB$INDEX_NAME 
and ISP.RDB$FIELD_POSITION = ISF.RDB$FIELD_POSITION 
order by 1, 5
