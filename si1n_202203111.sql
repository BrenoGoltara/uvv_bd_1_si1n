-- Database: uvv

-- DROP DATABASE IF EXISTS uvv;
CREATE ROLE "Breno Garabele Goltara" WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

CREATE DATABASE uvv
    WITH 
    OWNER = "Breno Garabele Goltara"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
SET AUTOCOMMIT = ON
	
CREATE TABLE hr.cargos (
             id_cargos VARCHAR(10) NOT NULL,
             cargo VARCHAR(35) NOT NULL,
             salario_minimo DECIMAL(8,2),
             salario_maximo DECIMAL(8,2),
             CONSTRAINT id_cargos PRIMARY KEY (id_cargos)
);
--Essa tabela se refere a cargos


CREATE UNIQUE INDEX ak_cargo
 ON cargos
 ( cargo );

CREATE TABLE hr.regioes (
             id_regiao INTEGER NOT NULL,
             nome VARCHAR(25) NOT NULL,
             CONSTRAINT id_regioes PRIMARY KEY (id_regiao)
);
--Essa tabela se refere a regioes


CREATE UNIQUE INDEX ak_nome
 ON regioes
 ( nome );

CREATE TABLE hr.paises (
                id_pais CHAR(2) NOT NULL,
                id_regiao INTEGER NOT NULL,
                nome VARCHAR(50),
                CONSTRAINT id_paises_ PRIMARY KEY (id_pais)
);
--Essa tabela se refere a paises
;


CREATE UNIQUE INDEX ak_nome2
 ON paises
 ( nome );

CREATE TABLE hr.localizacoes (
             id_localizacao INTEGER NOT NULL,
             id_pais CHAR(2) NOT NULL,
             endereco VARCHAR(50),
             cep VARCHAR(12),
             cidade VARCHAR(50),
             uf VARCHAR(25),
             CONSTRAINT id_localizacoes PRIMARY KEY (id_localizacao)
);
--Essa tabela se refere a localizacoes


CREATE TABLE hr.departamentos (
             id_departamentos INTEGER NOT NULL,
             id_gerente INTEGER NOT NULL,
             id_localizacao INTEGER NOT NULL,
             nome VARCHAR(50),
             CONSTRAINT id_departamentos PRIMARY KEY (id_departamentos)
);
--Essa tabela se refere a departamentos
;


CREATE UNIQUE INDEX ak_nome3
 ON departamentos
 ( nome );

CREATE TABLE hr.empregados (
             id_empregados INTEGER NOT NULL,
             id_departamentos INTEGER NOT NULL,
             id_cargos VARCHAR(10) NOT NULL,
             nome VARCHAR(75) NOT NULL,
             email VARCHAR(35) NOT NULL,
             telefone VARCHAR(20),
             data_contratacao DATE NOT NULL,
             salario DECIMAL(8,2),
             comissao DECIMAL(4,2),
             id_supervisor INTEGER NOT NULL,
             CONSTRAINT id_empregados PRIMARY KEY (id_empregados)
);
--Essa tabela se refere a empregados


CREATE UNIQUE INDEX ak_email
 ON empregados
 ( email );

CREATE TABLE hr.historico_cargos (
             id_empregados INTEGER NOT NULL,
             data_inicial DATE NOT NULL,
             id_departamentos INTEGER NOT NULL,
             id_cargos VARCHAR(10) NOT NULL,
             data_final DATE NOT NULL,
             CONSTRAINT id_historico_cargos PRIMARY KEY (id_empregados, data_inicial, id_departamentos)
);
--Essa tabela se refere a historicos de cargos


ALTER TABLE empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargos)
REFERENCES cargos (id_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk
FOREIGN KEY (id_cargos)
REFERENCES cargos (id_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE paises ADD CONSTRAINT regioes_paises_fk
FOREIGN KEY (id_regiao)
REFERENCES regioes (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE localizacoes ADD CONSTRAINT paises_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE empregados ADD CONSTRAINT departamentos_empregados_fk
FOREIGN KEY (id_departamentos)
REFERENCES departamentos (id_departamentos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk
FOREIGN KEY (id_departamentos)
REFERENCES departamentos (id_departamentos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamentos ADD CONSTRAINT empregados_departamentos_fk
FOREIGN KEY (id_gerente)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_supervisor)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregados)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
CREATE TABLE cargos (
                id_cargos VARCHAR(10) NOT NULL,
                cargo VARCHAR(35) NOT NULL,
                salario_minimo DECIMAL(8,2),
                salario_maximo DECIMAL(8,2),
                CONSTRAINT id_cargos PRIMARY KEY (id_cargos)
);
COMMENT ON TABLE cargos IS 'Essa tabela se refere a cargos';


CREATE UNIQUE INDEX ak_cargo
 ON cargos
 ( cargo );

CREATE TABLE regioes (
                id_regiao INTEGER NOT NULL,
                nome VARCHAR(25) NOT NULL,
                CONSTRAINT id_regioes PRIMARY KEY (id_regiao)
);
COMMENT ON TABLE regioes IS 'Essa tabela se refere a regioes';


CREATE UNIQUE INDEX ak_nome
 ON regioes
 ( nome );

CREATE TABLE paises (
                id_pais CHAR(2) NOT NULL,
                id_regiao INTEGER NOT NULL,
                nome VARCHAR(50),
                CONSTRAINT id_paises_ PRIMARY KEY (id_pais)
);
COMMENT ON TABLE paises IS 'Essa tabela se refere a paises
';


CREATE UNIQUE INDEX ak_nome2
 ON paises
 ( nome );

CREATE TABLE localizacoes (
                id_localizacao INTEGER NOT NULL,
                id_pais CHAR(2) NOT NULL,
                endereco VARCHAR(50),
                cep VARCHAR(12),
                cidade VARCHAR(50),
                uf VARCHAR(25),
                CONSTRAINT id_localizacoes PRIMARY KEY (id_localizacao)
);
COMMENT ON TABLE localizacoes IS 'Essa tabela se refere a localizacoes';


CREATE TABLE departamentos (
                id_departamentos INTEGER NOT NULL,
                id_gerente INTEGER NOT NULL,
                id_localizacao INTEGER NOT NULL,
                nome VARCHAR(50),
                CONSTRAINT id_departamentos PRIMARY KEY (id_departamentos)
);
COMMENT ON TABLE departamentos IS 'Essa tabela se refere a departamentos
';


CREATE UNIQUE INDEX ak_nome3
 ON departamentos
 ( nome );

CREATE TABLE empregados (
                id_empregados INTEGER NOT NULL,
                id_departamentos INTEGER NOT NULL,
                id_cargos VARCHAR(10) NOT NULL,
                nome VARCHAR(75) NOT NULL,
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                data_contratacao DATE NOT NULL,
                salario DECIMAL(8,2),
                comissao DECIMAL(4,2),
                id_supervisor INTEGER NOT NULL,
                CONSTRAINT id_empregados PRIMARY KEY (id_empregados)
);
COMMENT ON TABLE empregados IS 'Essa tabela se refere a empregados';


CREATE UNIQUE INDEX ak_email
 ON empregados
 ( email );

CREATE TABLE historico_cargos (
                id_empregados INTEGER NOT NULL,
                data_inicial DATE NOT NULL,
                id_departamentos INTEGER NOT NULL,
                id_cargos VARCHAR(10) NOT NULL,
                data_final DATE NOT NULL,
                CONSTRAINT id_historico_cargos PRIMARY KEY (id_empregados, data_inicial, id_departamentos)
);
COMMENT ON TABLE historico_cargos IS 'Essa tabela se refere a historicos de cargos';


ALTER TABLE empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargos)
REFERENCES cargos (id_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk
FOREIGN KEY (id_cargos)
REFERENCES cargos (id_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE paises ADD CONSTRAINT regioes_paises_fk
FOREIGN KEY (id_regiao)
REFERENCES regioes (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE localizacoes ADD CONSTRAINT paises_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE empregados ADD CONSTRAINT departamentos_empregados_fk
FOREIGN KEY (id_departamentos)
REFERENCES departamentos (id_departamentos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk
FOREIGN KEY (id_departamentos)
REFERENCES departamentos (id_departamentos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamentos ADD CONSTRAINT empregados_departamentos_fk
FOREIGN KEY (id_gerente)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_supervisor)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregados)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- tabelas feita pelo oracle sql developer

INSERT INTO hr.regioes (id_regiao, nome) VALUES
(1, 'Europa');

INSERT INTO hr.regioes (id_regiao, nome) VALUES
(2, 'America');

INSERT INTO hr.regioes (id_regiao, nome) VALUES
(3, 'Asia');

INSERT INTO hr.regioes (id_regiao, nome) VALUES
(4, 'Africa');

INSERT INTO hr.paises (id_pais, nome, id_regiao) VALUES
(1, 'Argentina"');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(2, 'Australia');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(3, 'Belgica');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(4, 'Brazil');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(5, 'china');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(6, 'França');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(DE, 'Germany"');
 
 INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(DK, 'Denmark" ');
 
INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(EG, 'Egypt" ');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(JP, 'Japan" ');

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(KW, 'Kuwait" '):

INSERT INTO hr.paises (id_pais, id_regiao, nome) VALUES
(MX, 'Mexico" ');

INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1000, 1297 Via Cola di Rie,'00989', Roma, ' || state_province ||, || country_id ||' );
 
INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1100, 93091 Calle della Testa,'1093493091', Venice, ' || state_province || ', ' || country_id ||');

INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1200, 2017 Shinjuku-ku,'1689', Tokyo, ' || state_province || ', ' || country_id ||');

INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1300, 9450 Kamiya-cho,'68239450', Hiroshima, ' || state_province || ', ' || country_id ||');

INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1400, 2014 Jabberwocky Rd,'26192', Southlake, ' || state_province || ', ' || country_id ||');

INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1500, 2011 Interiors Blvd,'99236', South San Francisco, ' || state_province || , ' || country_id ||);

INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1600, 2007 Zagora St,'500902007', South Brunswick, ' || state_province || ', ' || country_id ||');

INSERT INTO hr.localizacoes (id_localizacao, id_pais, endereco, cep, cidade, uf) VALUES
(1700, 2004 Charade Rd,'98199, Seattle, ' || state_province || ,' || country_id ||');

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(100, 'Steven King', 'SKING', '515.123.4567', '2003-06-17, 'AD_PRES', 24000, null, null, 90');"

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(101, 'Neena Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21, 'AD_VP', 17000, null, 100, 90');"

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(102, 'Lex De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13, 'AD_VP', 17000, null, 100, 90');"

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(103, 'Alexander Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03, 'IT_PROG', 9000, null, 102, 60');"

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(104, 'Bruce Ernst', 'BERNST', '590.423.4568', '2007-05-21, 'IT_PROG', 6000, null, 103, 60');"

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(105, 'David Austin', 'DAUSTIN', '590.423.4569', '2005-06-25, 'IT_PROG', 4800, null, 103, 60');"

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(106, 'Valli Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05, 'IT_PROG', 4800, null, 103, 60');

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(107, 'Diana Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07, 'IT_PROG', 4200, null, 103, 60');"

INSERT INTO hr.empregados (id_empregado, id_departamentos, id_cargos, nome, email, telefone,
						  data_contratacao, salario, comissao, id_supervisor) VALUES
(108, 'Nancy Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17, 'FI_MGR', 12008, null, 101, 100');"

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(10','Administration,'200, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(20','Marketing,'201, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(30','Purchasing,'114, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(40','Human Resources,'203, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(50','Shipping,'121,  ||  location_id');

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(60','IT,'103, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(70','Public Relations,'204, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(80','Sales,'145, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(90','Executive,'100, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(100','Finance,'108, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(110','Accounting,'205, ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(120','Treasury,''' ||  location_id');

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(130','Corporate Tax,' ||  location_id');

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(140','Control And Credit,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(150','Shareholder Services, ' ||  location_id');

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(160','Benefits,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(170','Manufacturing,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(180','Construction,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(190','Contracting,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(200','Operations,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(210','IT Support,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(220','NOC,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(230','IT Helpdesk,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(240','Government Sales,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(250','Retail Sales,' ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(260','Recruiting,'" ' ||  location_id);

INSERT INTO hr.departamentos (id_departamentos, id_gerente, id_localizacao, nome) VALUES
(270','Payroll,'" ' ||  location_id);

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(AD_PRES" ' || job_title || ','20080',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(AD_VP" ' || job_title || ','15000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(AD_ASST" ' || job_title || ','3000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(FI_MGR" ' || job_title || ','8200',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(FI_ACCOUNT" ' || job_title || ','4200',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(AC_MGR" ' || job_title || ','8200',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(AC_ACCOUNT" ' || job_title || ','4200',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(SA_MAN" ' || job_title || ','10000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(SA_REP" ' || job_title || ','6000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(PU_MAN" ' || job_title || ','8000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(PU_CLERK" ' || job_title || ','2500',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(ST_MAN" ' || job_title || ','5500',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(ST_CLERK" ' || job_title || ','2008',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(SH_CLERK" ' || job_title || ','2500',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(IT_PROG" ' || job_title || ','4000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(MK_MAN" ' || job_title || ','9000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(MK_REP" ' || job_title || ','4000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(HR_REP" ' || job_title || ','4000',' || max_salary');

INSERT INTO hr.cargos (id_cargos, cargo, salario_minimo, salario_maximo) VALUES
(PR_REP" ' || job_title || ','4500',' || max_salary');

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(101, ' || start_date || ' ' || end_date || '  || job_id || ''|| department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(101, ' || start_date || ' ' || end_date || ' || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(102, ' || start_date || ' ' || end_date || ' || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(114, ' || start_date || ' ' || end_date || '  || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(122, ' || start_date || ' ' || end_date || '  || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(176, ' || start_date || ' ' || end_date || '  || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(176, ' || start_date || ' ' || end_date || '  || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(200, ' || start_date || ' ' || end_date || '  || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(200, ' || start_date || ' ' || end_date || '  || job_id || '' || department_id);

INSERT INTO hr.historico_cargos (id_empregados, data_inicial, id_departamentos, id_cargos, data_final) VALUES
(201, ' || start_date || ' ' || end_date || '  || job_id || '' || department_id);