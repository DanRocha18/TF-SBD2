-- ------------------ < Trabalho Final Grupo E12 > ------------------------------------
--
--                      SCRIPT APAGA (DDL)
--
-- Data Criacao ...........: 15/02/2025
-- Autor(es) ..............: Arthur Taylor de Jesus Popov,
--                           Daniel Rocha Oliveira,
-- 							             Eurico Menezes de Abreu Neto,
--                           Matheus Phillipo Silverio Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: Employee
--
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
--         => 02 Views
--
-- Ultimas Alterações
-- 15/02/2025 => Criação do Script Apaga para o banco de dados test_db
-- --------------------------------------------------------------------------
DROP VIEW IF EXISTS current_dept_emp;
DROP VIEW IF EXISTS dept_emp_latest_date;

DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;
