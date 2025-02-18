-- ------------------- < Trabalho final Grupo E12 > -----------------------
--
--                    SCRIPT DE FISICO (DDL)
--
-- Data Criacao ...........: 15/02/2025
-- Autor(es) ..............: Arthur Taylor de Jesus Popov,
--                           Daniel Rocha Oliveira,
-- 							 Eurico Menezes de Abreu Neto,
--                           Matheus Phillipo Silverio Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: Employee
--
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
--         => 03 Views
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS Employee;
USE Employee;

CREATE TABLE EMPLOYEE (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
) ENGINE = InnoDB;

CREATE TABLE DEPARTMENT (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
) ENGINE = InnoDB;

CREATE TABLE DEPT_MANAGER (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES EMPLOYEE (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES DEPARTMENT (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
) ENGINE = InnoDB; 

CREATE TABLE DEPT_EMP (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES EMPLOYEE   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES DEPARTMENT (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
) ENGINE = InnoDB;

CREATE TABLE TITLE (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES EMPLOYEE (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
) ENGINE = InnoDB; 

CREATE TABLE SALARY (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES EMPLOYEE (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
) ENGINE = InnoDB;	
