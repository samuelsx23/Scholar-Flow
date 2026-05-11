--  Tabelas de Configuração 
INSERT IGNORE INTO tb_etnias (pk_id_etnia, tipo_etnia) VALUES (1, 'Parda'), (2, 'Branca'), (3, 'Preta');
INSERT IGNORE INTO tb_generos (pk_id_genero, tipo_genero) VALUES (1, 'Masculino'), (2, 'Feminino');
INSERT IGNORE INTO tb_orientacao_sexual (pk_id_orientacao, tipo_orientacao) VALUES (1, 'Heterossexual'), (2, 'Bissexual');
INSERT IGNORE INTO tb_deficiencias (pk_id_deficiencia, tipo_deficiencia) VALUES (1, 'Nenhuma'), (2, 'Visual');
INSERT IGNORE INTO tb_cargos (pk_id_cargo_funcionario, nome_cargo, descricao_cargo) VALUES (1, 'Professor', 'Docente'), (2, 'Coordenador', 'Gestão');
INSERT IGNORE INTO tb_tipo_beneficio (pk_id_tipo_beneficio, nome_beneficio) VALUES (1, 'VR'), (2, 'VA');
INSERT IGNORE INTO tb_tipo_ocorrencia (pk_id_tipo_ocorrencia, classificacao_ocorrencia, descricao_ocorrencia) VALUES (1, 'Falta', 'Falta sem atestado');
INSERT IGNORE INTO tb_dados_bancarios (pk_id_conta_bancaria, banco, agencia, conta, digito_verificador) VALUES (1, '001', '1234', '55667', '8');

-- Perfis 
INSERT IGNORE INTO tb_perfil (pk_cpf, nome, data_nascimento, fk_id_etnia, fk_id_genero, fk_id_orientacao, estado_civil) VALUES 
('11122233301', 'Raphael Oliveira', '2002-05-15', 1, 1, 1, 'Solteiro'),
('11122233302', 'Ana Beatriz Souza', '2001-10-20', 2, 2, 1, 'Solteira'),
('11122233303', 'Carlos Eduardo Lima', '1998-03-12', 1, 1, 2, 'Casado'),
('11122233304', 'Mariana Santos', '2003-07-08', 2, 2, 1, 'Solteira'),
('11122233305', 'Ricardo Pereira', '1999-12-01', 1, 1, 1, 'Solteiro'),
('11122233306', 'Beatriz Costa', '2002-02-14', 2, 2, 1, 'Solteira'),
('11122233307', 'Fernanda Lima', '2001-04-25', 1, 2, 1, 'Solteira'),
('11122233308', 'Gabriel Silva', '2000-09-30', 2, 1, 1, 'Solteiro'),
('11122233309', 'Juliana Rocha', '2003-01-10', 1, 2, 1, 'Solteira'),
('11122233310', 'Tiago Almeida', '1997-11-22', 2, 1, 2, 'Casado'),
('11122233311', 'Professor Clovis', '1985-06-15', 1, 1, 1, 'Casado'),
('11122233312', 'Marcos Funcionario', '1990-08-20', 2, 1, 1, 'Solteiro'),
('11122233313', 'Elaine RH', '1988-03-05', 1, 2, 1, 'Casada'),
('11122233314', 'Bruno Diretor', '1980-01-10', 2, 1, 1, 'Casado'),
('11122233315', 'Carla Secretaria', '1995-12-25', 1, 2, 1, 'Solteira');

--Logins
INSERT IGNORE INTO tb_login (pk_id_login, email_academico, senha, tipo_acesso) VALUES 
(1, 'raphael@edu.com', '123', 'Aluno'), (2, 'ana@edu.com', '123', 'Aluno'),
(3, 'carlos@edu.com', '123', 'Aluno'), (4, 'mariana@edu.com', '123', 'Aluno'),
(5, 'ricardo@edu.com', '123', 'Aluno'), (6, 'beatriz@edu.com', '123', 'Aluno'),
(7, 'fernanda@edu.com', '123', 'Aluno'), (8, 'gabriel@edu.com', '123', 'Aluno'),
(9, 'juliana@edu.com', '123', 'Aluno'), (10, 'tiago@edu.com', '123', 'Aluno'),
(11, 'clovis@edu.com', 'admin', 'Professor'), (12, 'marcos@rh.com', '123', 'Staff'),
(13, 'elaine@rh.com', '123', 'Staff'), (14, 'bruno@rh.com', '123', 'Staff'),
(15, 'carla@rh.com', '123', 'Staff');

-- 4. Contatos 
INSERT IGNORE INTO tb_endereco_email (pk_id_email, fk_cpf, email) VALUES (1, '11122233301', 'rapha.pessoal@gmail.com');
INSERT IGNORE INTO tb_numero_telefone (pk_id_numero, fk_cpf, telefone) VALUES (1, '11122233301', '11988887777');
INSERT IGNORE INTO tb_endereco_residencial (pk_id_endereco, fk_cpf, cep, logradouro, numero_residencia, bairro, cidade, uf) 
VALUES (1, '11122233301', '03310000', 'Rua Tatuapé', '500', 'Tatuapé', 'São Paulo', 'SP');
INSERT IGNORE INTO tb_perfil_deficiencias (pk_id_perfil_deficiencia, fk_cpf, fk_id_deficiencia) VALUES (1, '11122233301', 1);

-- Acadêmico 
INSERT IGNORE INTO tb_aluno (pk_id_aluno, fk_id_login, fk_cpf) VALUES 
(1, 1, '11122233301'), (2, 2, '11122233302'), (3, 3, '11122233303'), (4, 4, '11122233304'), (5, 5, '11122233305'),
(6, 6, '11122233306'), (7, 7, '11122233307'), (8, 8, '11122233308'), (9, 9, '11122233309'), (10, 10, '11122233310');

INSERT IGNORE INTO tb_cursos (pk_id_curso, nome_curso) VALUES (1, 'Análise e Desenvolvimento de Sistemas');
INSERT IGNORE INTO tb_disciplinas (pk_id_disciplina, fk_id_curso, nome_disciplina) VALUES (1, 1, 'Banco de Dados');
INSERT IGNORE INTO tb_turmas (pk_id_turma, fk_id_curso, semestre, ano) VALUES (1, 1, '1º Semestre', '2026-01-01');
INSERT IGNORE INTO tb_matricula (pk_id_matricula, fk_id_aluno, fk_id_turma, data_matricula) VALUES (1, 1, 1, '2026-02-01');
INSERT IGNORE INTO tb_notas (pk_id_nota, fk_id_matricula, fk_id_disciplina, valor_nota, data_nota) VALUES (1, 1, 1, 95, '2026-05-10');
INSERT IGNORE INTO tb_faltas (pk_id_falta, fk_id_matricula, fk_id_disciplina, data_falta) VALUES (1, 1, 1, '2026-04-05');

-- Recursos Humanos 
INSERT IGNORE INTO tb_funcionarios (pk_id_funcionario, fk_cpf, fk_id_cargo_funcionario, data_contratado) VALUES 
(1, '11122233311', 1, '2020-01-10'), (2, '11122233312', 2, '2021-03-15'), 
(3, '11122233313', 2, '2022-05-20'), (4, '11122233314', 2, '2019-11-01'), 
(5, '11122233315', 2, '2023-01-10');

INSERT IGNORE INTO tb_professores (pk_id_professor, fk_id_login, fk_id_funcionario) VALUES (1, 11, 1);
INSERT IGNORE INTO tb_professor_turma (pk_id_alocacao, fk_id_professor, fk_id_turma) VALUES (1, 1, 1);
INSERT IGNORE INTO tb_beneficio_funcionario (pk_id_beneficio_funcionario, fk_id_tipo_beneficio, fk_id_funcionario, valor_beneficio) VALUES (1, 1, 1, 500.00);
INSERT IGNORE INTO tb_ocorrencias_funcionario (pk_id_ocorrencia, fk_id_funcionario, fk_id_tipo_ocorrencia, data_ocorrencia, relato_ocorrencia) VALUES (1, 1, 1, '2026-05-01', 'Chegou 10min atrasado');
INSERT IGNORE INTO tb_descontos_funcionarios (pk_id_desconto, fk_id_ocorrencia, valor_desconto) VALUES (1, 1, 10.00);
INSERT IGNORE INTO tb_conta_bancaria_funcionario (pk_id_vinculacao_conta, fk_id_funcionario, fk_id_conta_bancaria, descricao_uso) VALUES (1, 1, 1, 'Salário');
INSERT IGNORE INTO tb_folha_pagamento (pk_id_pagamento, fk_id_funcionario, salario_base, salario_liquido, total_beneficios, data_pagamento) VALUES (1, 1, 4000.00, 3990.00, 500.00, '2026-05-05');

-- Financeiro Acadêmico
INSERT IGNORE INTO tb_contrato_educacional (pk_id_contrato, fk_id_aluno, fk_id_curso, valor_total, data_assinatura) VALUES (1, 1, 1, 12000.00, '2026-01-15');
INSERT IGNORE INTO tb_mensalidade (pk_id_mensalidade, fk_id_contrato, valor_parcela, data_vencimento, status_pagamento) VALUES (1, 1, 1000.00, '2026-02-15', 'Pago');
