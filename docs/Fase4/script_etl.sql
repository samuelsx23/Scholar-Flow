-- Consolida dados de Perfil, Aluno e Localização
INSERT IGNORE INTO dim_aluno (id_aluno, cpf, nome, genero, etnia, cidade, uf)
SELECT 
    a.pk_id_aluno, 
    p.pk_cpf, 
    p.nome, 
    g.tipo_genero, 
    e.tipo_etnia, 
    er.cidade, 
    er.uf
FROM tb_aluno a
JOIN tb_perfil p ON a.fk_cpf = p.pk_cpf
JOIN tb_generos g ON p.fk_id_genero = g.pk_id_genero
JOIN tb_etnias e ON p.fk_id_etnia = e.pk_id_etnia
JOIN tb_endereco_residencial er ON p.pk_cpf = er.fk_cpf;

-- Carga direta de Cursos e Disciplinas
INSERT IGNORE INTO dim_curso (id_curso, nome_curso)
SELECT pk_id_curso, nome_curso FROM tb_cursos;

INSERT IGNORE INTO dim_disciplina (id_disciplina, nome_disciplina)
SELECT pk_id_disciplina, nome_disciplina FROM tb_disciplinas;

-- Carga de Status Financeiro
INSERT IGNORE INTO dim_status_pagamento (status_pagamento)
SELECT DISTINCT status_pagamento FROM tb_mensalidade;

--  Dimensão Tempo Exemplos de carga temporal
INSERT IGNORE INTO dim_tempo (data_completa, dia, mes, ano, semestre, trimestre, nome_mes)
VALUES 
('2026-02-10', 10, 02, 2026, '2026/1', 1, 'Fevereiro'),
('2026-05-10', 10, 05, 2026, '2026/1', 2, 'Maio');


--TABELAS FATO 


-- Fato Financeiro Métrica de Receita e Contratos
INSERT IGNORE INTO fato_financeiro (fk_aluno, fk_curso, fk_tempo, fk_status, valor_parcela, valor_total_contrato, quantidade_parcelas)
SELECT 
    da.sk_aluno, 
    dc.sk_curso, 
    dt.sk_tempo, 
    dsp.sk_status, 
    m.valor_parcela, 
    ce.valor_total,
    COUNT(m.pk_id_mensalidade)
FROM tb_mensalidade m
JOIN tb_contrato_educacional ce ON m.fk_id_contrato = ce.pk_id_contrato
JOIN tb_aluno a ON ce.fk_id_aluno = a.pk_id_aluno
JOIN dim_aluno da ON a.pk_id_aluno = da.id_aluno
JOIN dim_curso dc ON ce.fk_id_curso = dc.id_curso
JOIN dim_tempo dt ON m.data_vencimento = dt.data_completa
JOIN dim_status_pagamento dsp ON m.status_pagamento = dsp.status_pagamento
GROUP BY da.sk_aluno, dc.sk_curso, dt.sk_tempo, dsp.sk_status, m.valor_parcela, ce.valor_total;

-- Fato Desempenho Acadêmico Métrica de Notas
INSERT IGNORE INTO fato_desempenho_academico (fk_aluno, fk_curso, fk_disciplina, fk_tempo, fk_status, valor_nota)
SELECT 
    da.sk_aluno, 
    dc.sk_curso, 
    dd.sk_disciplina, 
    dt.sk_tempo, 
    dsp.sk_status, 
    n.valor_nota
FROM tb_notas n
JOIN tb_matricula m ON n.fk_id_matricula = m.pk_id_matricula
JOIN tb_turmas t ON m.fk_id_turma = t.pk_id_turma
JOIN tb_cursos c ON t.fk_id_curso = c.pk_id_curso
JOIN dim_aluno da ON m.fk_id_aluno = da.id_aluno
JOIN dim_curso dc ON c.pk_id_curso = dc.id_curso
JOIN dim_disciplina dd ON n.fk_id_disciplina = dd.id_disciplina
JOIN dim_tempo dt ON n.data_nota = dt.data_completa
LEFT JOIN dim_status_pagamento dsp ON dsp.status_pagamento = 'Pago';
