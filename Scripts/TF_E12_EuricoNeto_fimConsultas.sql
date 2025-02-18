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

USE Employee;

-- Views já criadas na base de dados

-- Essa VIEW é utilizada para obter a data mais recente (from_date e to_date) de cada funcionário
-- registrado na tabela dept_emp. Como um funcionário pode ter trabalhado em múltiplos departamentos
-- ao longo do tempo, essa VIEW ajuda a identificar o último registro disponível.
-- Para consultar a view:
-- SELECT * FROM dept_emp_latest_date;
CREATE OR REPLACE VIEW dept_emp_latest_date AS
    SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM dept_emp
    GROUP BY emp_no;

-- Essa VIEW mostra apenas os funcionários que ainda estão empregados em um departamento.
-- Ela é criada a partir da dept_emp_latest_date e verifica quais funcionários ainda possuem
-- uma relação ativa com algum departamento.
-- Para consultar a view:
-- SELECT * FROM current_dept_emp;
CREATE OR REPLACE VIEW current_dept_emp AS
    SELECT l.emp_no, dept_no, l.from_date, l.to_date
    FROM dept_emp d
        INNER JOIN dept_emp_latest_date l
        ON d.emp_no=l.emp_no AND d.from_date=l.from_date AND l.to_date = d.to_date;

-- Essa VIEW retorna uma lista dos funcionários ordenados pelos salários de forma decrescente,
-- permitindo que se identifique rapidamente os empregados que ganham mais na empresa.
-- Para consultar a view:
-- SELECT * FROM employee.highest_salaries;
CREATE OR REPLACE VIEW employee.highest_salaries AS
    SELECT s.emp_no, e.first_name, s.salary
    FROM employee.salary s
    JOIN employee.employee e ON s.emp_no = e.emp_no
    ORDER BY s.amount DESC;