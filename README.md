# sqlserver_liquibase_identity


 In Sqlserver, DBCC CHECKIDENT  allows us to reset  auto-increment  fields. By using it  the liquibase rollbacks can be performed in  better way.
 
 <b>Example:</b>
 
 --liquibase formatted sql
 
--changeset akaiser:2

INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test1', 'test1', 0);

INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test2', 'test2', 0);

INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test3', 'test3', 0);

--rollback DELETE FROM tte_person WHERE per_id = 1;

--rollback DELETE FROM tte_person WHERE per_id = 2;

--rollback DELETE FROM tte_person WHERE per_id = 3;

--rollback DBCC CHECKIDENT('tte_person', RESEED, 0);


<b>Or with Liquibase:</b>
 
liquibase update

liquibase  rollbackCount 1

liquibase  rollbackCount 1

liquibase update
