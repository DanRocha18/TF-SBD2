-- ------------------ < TF-SBD2 GRUPO E12 > ------------------------------------
--
--                      SCRIPT APAGA (DDL)
--
-- Data Criacao ...........: 15/02/2025
-- Autor(es) ..............: Daniel Rocha Oliveira
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: test_db
--
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
--         => 02 Views
--
-- Ultimas Alterações
-- 15/02/2025 => Criação do Script Apaga para o banco de dados test_db
-- --------------------------------------------------------------------------



-- Apagar as views primeiro pois dependem das tabelas criadas
DROP VIEW IF EXISTS current_dept_emp;
DROP VIEW IF EXISTS dept_emp_latest_date;

-- Apagar as tabelas em ordem reversa para evitar conflitos de chave estrangeira
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
