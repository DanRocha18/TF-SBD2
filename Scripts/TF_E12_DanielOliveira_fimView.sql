
-- ------------------ < Trabalho Final Grupo E12 > ------------------------------------
--
--                      SCRIPT CONSULTA (VIEW)
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
--
-- Ultimas Alterações
-- 15/02/2025 => Criação do Script de views para o banco de dados Employee
-- --------------------------------------------------------------------------

-- Views já criadas na base de dados
USE Employee;
CREATE OR REPLACE VIEW dept_emp_latest_date AS
    SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM dept_emp
    GROUP BY emp_no;

CREATE OR REPLACE VIEW current_dept_emp AS
    SELECT l.emp_no, dept_no, l.from_date, l.to_date
    FROM dept_emp d
        INNER JOIN dept_emp_latest_date l
        ON d.emp_no=l.emp_no AND d.from_date=l.from_date AND l.to_date = d.to_date;

-- Nova view adicionada que mostra os salários dos funcionários em ordem decrescente

CREATE OR REPLACE VIEW employee.highest_salaries AS
SELECT s.emp_no, e.first_name, s.amount
FROM employee.salary s
JOIN employee.employee e ON s.emp_no = e.emp_no
ORDER BY s.amount DESC;