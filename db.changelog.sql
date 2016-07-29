--liquibase formatted sql

--changeset akaiser:1
CREATE TABLE tte_jobpers (per_id int NOT NULL, job_id int NOT NULL, jop_description image NULL, jop_datestart varchar(255) NOT NULL, jop_dateend datetime NULL, jop_deleted int NOT NULL, PRIMARY KEY (per_id, job_id));
CREATE TABLE tte_job (job_id int IDENTITY NOT NULL, job_name varchar(255) NOT NULL, job_deleted int NOT NULL, PRIMARY KEY (job_id));
CREATE TABLE tte_contpers (con_id int NOT NULL, per_id int NOT NULL, cop_note image NULL, cop_datestart datetime NOT NULL, cop_dateend datetime NULL, cop_deleted int NOT NULL, PRIMARY KEY (con_id, per_id));
CREATE TABLE tte_contract (con_id int IDENTITY NOT NULL, con_name varchar(255) NOT NULL, con_salary int NOT NULL, con_deleted int NOT NULL, PRIMARY KEY (con_id));
CREATE TABLE tte_person (per_id int IDENTITY NOT NULL, per_fname varchar(255) NOT NULL, per_lname varchar(255) NOT NULL, per_deleted int NOT NULL, PRIMARY KEY (per_id));
ALTER TABLE tte_jobpers ADD CONSTRAINT FKtte_jobper80924 FOREIGN KEY (job_id) REFERENCES tte_job (job_id);
ALTER TABLE tte_jobpers ADD CONSTRAINT FKtte_jobper403855 FOREIGN KEY (per_id) REFERENCES tte_person (per_id);
ALTER TABLE tte_contpers ADD CONSTRAINT FKtte_contpe670717 FOREIGN KEY (per_id) REFERENCES tte_person (per_id);
ALTER TABLE tte_contpers ADD CONSTRAINT FKtte_contpe36105 FOREIGN KEY (con_id) REFERENCES tte_contract (con_id);
--rollback ALTER TABLE tte_jobpers DROP CONSTRAINT FKtte_jobper80924;
--rollback ALTER TABLE tte_jobpers DROP CONSTRAINT FKtte_jobper403855;
--rollback ALTER TABLE tte_contpers DROP CONSTRAINT FKtte_contpe670717;
--rollback ALTER TABLE tte_contpers DROP CONSTRAINT FKtte_contpe36105;
--rollback DROP TABLE tte_jobpers;
--rollback DROP TABLE tte_job;
--rollback DROP TABLE tte_contpers;
--rollback DROP TABLE tte_contract;
--rollback DROP TABLE tte_person;

--changeset akaiser:2
INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test1', 'test1', 0);
INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test2', 'test2', 0);
INSERT INTO tte_person ( per_fname, per_lname, per_deleted) VALUES ( 'test3', 'test3', 0);
--rollback DELETE FROM tte_person WHERE per_id = 1;
--rollback DELETE FROM tte_person WHERE per_id = 2;
--rollback DELETE FROM tte_person WHERE per_id = 3;
--rollback DBCC CHECKIDENT('tte_person', RESEED, 0);

