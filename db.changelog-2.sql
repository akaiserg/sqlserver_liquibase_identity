--liquibase formatted sql
--changeset akaiser:2
INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test1', 'test1', 0);
INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test2', 'test2', 0);
INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test3', 'test3', 0);
--rollback DELETE FROM tte_person WHERE per_id = 1;
--rollback DELETE FROM tte_person WHERE per_id = 2;
--rollback DELETE FROM tte_person WHERE per_id = 3;
--rollback DBCC CHECKIDENT('tte_person', RESEED, 0);