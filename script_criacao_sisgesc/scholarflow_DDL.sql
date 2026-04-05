CREATE TABLE `tb_perfil` (
  `pk_cpf` char(11) PRIMARY KEY,
  `nome` varchar(50) NOT NULL,
  `nome_social` varchar(50),
  `data_nascimento` date NOT NULL,
  `fk_id_etnia` int NOT NULL,
  `fk_id_genero` int NOT NULL,
  `fk_id_orientacao` int NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `numero_filhos` tinyint DEFAULT 0
);

CREATE TABLE `tb_endereco_email` (
  `pk_id_email` int PRIMARY KEY AUTO_INCREMENT,
  `fk_cpf` char(11) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL
);

CREATE TABLE `tb_numero_telefone` (
  `pk_id_numero` int PRIMARY KEY AUTO_INCREMENT,
  `fk_cpf` char(11) NOT NULL,
  `telefone` varchar(11) UNIQUE NOT NULL
);

CREATE TABLE `tb_endereco_residencial` (
  `pk_id_endereco` int PRIMARY KEY AUTO_INCREMENT,
  `fk_cpf` char(11) NOT NULL,
  `cep` char(8) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero_residencia` varchar(10) NOT NULL,
  `complemento` varchar(30),
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` char(2) NOT NULL
);

CREATE TABLE `tb_etnias` (
  `pk_id_etnia` int PRIMARY KEY AUTO_INCREMENT,
  `tipo_etnia` varchar(50) NOT NULL
);

CREATE TABLE `tb_generos` (
  `pk_id_genero` int PRIMARY KEY AUTO_INCREMENT,
  `tipo_genero` varchar(50) NOT NULL
);

CREATE TABLE `tb_orientacao_sexual` (
  `pk_id_orientacao` int PRIMARY KEY AUTO_INCREMENT,
  `tipo_orientacao` varchar(50) NOT NULL
);

CREATE TABLE `tb_deficiencias` (
  `pk_id_deficiencia` int PRIMARY KEY AUTO_INCREMENT,
  `tipo_deficiencia` varchar(50) UNIQUE NOT NULL
);

CREATE TABLE `tb_perfil_deficiencias` (
  `pk_id_perfil_deficiencia` int PRIMARY KEY AUTO_INCREMENT,
  `fk_cpf` char(11) NOT NULL,
  `fk_id_deficiencia` int NOT NULL
);

CREATE TABLE `tb_login` (
  `pk_id_login` int PRIMARY KEY AUTO_INCREMENT,
  `email_academico` varchar(100) UNIQUE NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo_acesso` varchar(20) NOT NULL
);

CREATE TABLE `tb_aluno` (
  `pk_id_aluno` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_login` int NOT NULL,
  `fk_cpf` char(11) UNIQUE NOT NULL
);

CREATE TABLE `tb_cursos` (
  `pk_id_curso` int PRIMARY KEY AUTO_INCREMENT,
  `nome_curso` varchar(50) NOT NULL
);

CREATE TABLE `tb_disciplinas` (
  `pk_id_disciplina` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_curso` int NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL
);

CREATE TABLE `tb_turmas` (
  `pk_id_turma` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_curso` int NOT NULL,
  `semestre` varchar(20) NOT NULL,
  `ano` date NOT NULL
);

CREATE TABLE `tb_matricula` (
  `pk_id_matricula` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_aluno` int NOT NULL,
  `fk_id_turma` int NOT NULL,
  `data_matricula` date NOT NULL
);

CREATE TABLE `tb_notas` (
  `pk_id_nota` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_matricula` int NOT NULL,
  `fk_id_disciplina` int NOT NULL,
  `valor_nota` int NOT NULL,
  `data_nota` date NOT NULL
);

CREATE TABLE `tb_faltas` (
  `pk_id_falta` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_matricula` int NOT NULL,
  `fk_id_disciplina` int NOT NULL,
  `data_falta` date NOT NULL
);

CREATE TABLE `tb_funcionarios` (
  `pk_id_funcionario` int PRIMARY KEY AUTO_INCREMENT,
  `fk_cpf` char(11) UNIQUE NOT NULL,
  `fk_id_cargo_funcionario` int NOT NULL,
  `data_contratado` date NOT NULL
);

CREATE TABLE `tb_cargos` (
  `pk_id_cargo_funcionario` int PRIMARY KEY AUTO_INCREMENT,
  `nome_cargo` varchar(30) UNIQUE NOT NULL,
  `descricao_cargo` varchar(50) NOT NULL
);

CREATE TABLE `tb_professores` (
  `pk_id_professor` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_login` int UNIQUE NOT NULL,
  `fk_id_funcionario` int UNIQUE NOT NULL
);

CREATE TABLE `tb_professor_turma` (
  `pk_id_alocacao` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_professor` int NOT NULL,
  `fk_id_turma` int NOT NULL
);

CREATE TABLE `tb_tipo_beneficio` (
  `pk_id_tipo_beneficio` int PRIMARY KEY AUTO_INCREMENT,
  `nome_beneficio` varchar(20) UNIQUE NOT NULL
);

CREATE TABLE `tb_beneficio_funcionario` (
  `pk_id_beneficio_funcionario` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_tipo_beneficio` int NOT NULL,
  `fk_id_funcionario` int NOT NULL,
  `valor_beneficio` decimal(5,2) NOT NULL
);

CREATE TABLE `tb_tipo_ocorrencia` (
  `pk_id_tipo_ocorrencia` int PRIMARY KEY AUTO_INCREMENT,
  `classificacao_ocorrencia` varchar(30) UNIQUE NOT NULL,
  `descricao_ocorrencia` varchar(100) NOT NULL,
  `pode_gerar_desconto` boolean DEFAULT false
);

CREATE TABLE `tb_ocorrencias_funcionario` (
  `pk_id_ocorrencia` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_funcionario` int NOT NULL,
  `fk_id_tipo_ocorrencia` int NOT NULL,
  `data_ocorrencia` date NOT NULL,
  `relato_ocorrencia` text NOT NULL
);

CREATE TABLE `tb_contrato_educacional` (
  `pk_id_contrato` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_aluno` int NOT NULL,
  `fk_id_curso` int NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `data_assinatura` date NOT NULL
);

CREATE TABLE `tb_mensalidade` (
  `pk_id_mensalidade` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_contrato` int NOT NULL,
  `valor_parcela` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL,
  `status_pagamento` varchar(20) NOT NULL
);

CREATE TABLE `tb_conta_bancaria_funcionario` (
  `pk_id_vinculacao_conta` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_funcionario` int NOT NULL,
  `fk_id_conta_bancaria` int NOT NULL,
  `conta_principal` boolean DEFAULT true,
  `descricao_uso` varchar(30) NOT NULL
);

CREATE TABLE `tb_dados_bancarios` (
  `pk_id_conta_bancaria` int PRIMARY KEY AUTO_INCREMENT,
  `banco` char(5) NOT NULL,
  `agencia` char(4) NOT NULL,
  `conta` varchar(12) NOT NULL,
  `digito_verificador` char(1) NOT NULL,
  `chave_pix` varchar(50) UNIQUE
);

CREATE TABLE `tb_folha_pagamento` (
  `pk_id_pagamento` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_funcionario` int UNIQUE NOT NULL,
  `salario_base` decimal(10,2) NOT NULL,
  `desconto_total` decimal(10,2) DEFAULT 0,
  `salario_liquido` decimal(10,2) NOT NULL,
  `total_beneficios` decimal(10,2) NOT NULL,
  `data_pagamento` date NOT NULL
);

CREATE TABLE `tb_descontos_funcionarios` (
  `pk_id_desconto` int PRIMARY KEY AUTO_INCREMENT,
  `fk_id_ocorrencia` int UNIQUE NOT NULL,
  `valor_desconto` decimal(10,2) NOT NULL
);

ALTER TABLE `tb_endereco_residencial` ADD FOREIGN KEY (`fk_cpf`) REFERENCES `tb_perfil` (`pk_cpf`);

ALTER TABLE `tb_endereco_email` ADD FOREIGN KEY (`fk_cpf`) REFERENCES `tb_perfil` (`pk_cpf`);

ALTER TABLE `tb_numero_telefone` ADD FOREIGN KEY (`fk_cpf`) REFERENCES `tb_perfil` (`pk_cpf`);

ALTER TABLE `tb_perfil_deficiencias` ADD FOREIGN KEY (`fk_cpf`) REFERENCES `tb_perfil` (`pk_cpf`);

ALTER TABLE `tb_perfil_deficiencias` ADD FOREIGN KEY (`fk_id_deficiencia`) REFERENCES `tb_deficiencias` (`pk_id_deficiencia`);

ALTER TABLE `tb_perfil` ADD FOREIGN KEY (`fk_id_etnia`) REFERENCES `tb_etnias` (`pk_id_etnia`);

ALTER TABLE `tb_perfil` ADD FOREIGN KEY (`fk_id_genero`) REFERENCES `tb_generos` (`pk_id_genero`);

ALTER TABLE `tb_perfil` ADD FOREIGN KEY (`fk_id_orientacao`) REFERENCES `tb_orientacao_sexual` (`pk_id_orientacao`);

ALTER TABLE `tb_aluno` ADD FOREIGN KEY (`fk_cpf`) REFERENCES `tb_perfil` (`pk_cpf`);

ALTER TABLE `tb_funcionarios` ADD FOREIGN KEY (`fk_cpf`) REFERENCES `tb_perfil` (`pk_cpf`);

ALTER TABLE `tb_aluno` ADD FOREIGN KEY (`fk_id_login`) REFERENCES `tb_login` (`pk_id_login`);

ALTER TABLE `tb_professores` ADD FOREIGN KEY (`fk_id_login`) REFERENCES `tb_login` (`pk_id_login`);

ALTER TABLE `tb_matricula` ADD FOREIGN KEY (`fk_id_aluno`) REFERENCES `tb_aluno` (`pk_id_aluno`);

ALTER TABLE `tb_turmas` ADD FOREIGN KEY (`fk_id_curso`) REFERENCES `tb_cursos` (`pk_id_curso`);

ALTER TABLE `tb_disciplinas` ADD FOREIGN KEY (`fk_id_curso`) REFERENCES `tb_cursos` (`pk_id_curso`);

ALTER TABLE `tb_matricula` ADD FOREIGN KEY (`fk_id_turma`) REFERENCES `tb_turmas` (`pk_id_turma`);

ALTER TABLE `tb_faltas` ADD FOREIGN KEY (`fk_id_matricula`) REFERENCES `tb_matricula` (`pk_id_matricula`);

ALTER TABLE `tb_notas` ADD FOREIGN KEY (`fk_id_matricula`) REFERENCES `tb_matricula` (`pk_id_matricula`);

ALTER TABLE `tb_faltas` ADD FOREIGN KEY (`fk_id_disciplina`) REFERENCES `tb_disciplinas` (`pk_id_disciplina`);

ALTER TABLE `tb_notas` ADD FOREIGN KEY (`fk_id_disciplina`) REFERENCES `tb_disciplinas` (`pk_id_disciplina`);

ALTER TABLE `tb_professores` ADD FOREIGN KEY (`fk_id_funcionario`) REFERENCES `tb_funcionarios` (`pk_id_funcionario`);

ALTER TABLE `tb_professor_turma` ADD FOREIGN KEY (`fk_id_professor`) REFERENCES `tb_professores` (`pk_id_professor`);

ALTER TABLE `tb_professor_turma` ADD FOREIGN KEY (`fk_id_turma`) REFERENCES `tb_turmas` (`pk_id_turma`);

ALTER TABLE `tb_funcionarios` ADD FOREIGN KEY (`fk_id_cargo_funcionario`) REFERENCES `tb_cargos` (`pk_id_cargo_funcionario`);

ALTER TABLE `tb_ocorrencias_funcionario` ADD FOREIGN KEY (`fk_id_funcionario`) REFERENCES `tb_funcionarios` (`pk_id_funcionario`);

ALTER TABLE `tb_ocorrencias_funcionario` ADD FOREIGN KEY (`fk_id_tipo_ocorrencia`) REFERENCES `tb_tipo_ocorrencia` (`pk_id_tipo_ocorrencia`);

ALTER TABLE `tb_contrato_educacional` ADD FOREIGN KEY (`fk_id_aluno`) REFERENCES `tb_aluno` (`pk_id_aluno`);

ALTER TABLE `tb_contrato_educacional` ADD FOREIGN KEY (`fk_id_curso`) REFERENCES `tb_cursos` (`pk_id_curso`);

ALTER TABLE `tb_mensalidade` ADD FOREIGN KEY (`fk_id_contrato`) REFERENCES `tb_contrato_educacional` (`pk_id_contrato`);

ALTER TABLE `tb_conta_bancaria_funcionario` ADD FOREIGN KEY (`fk_id_conta_bancaria`) REFERENCES `tb_dados_bancarios` (`pk_id_conta_bancaria`);

ALTER TABLE `tb_funcionarios` ADD FOREIGN KEY (`pk_id_funcionario`) REFERENCES `tb_conta_bancaria_funcionario` (`fk_id_funcionario`);

ALTER TABLE `tb_beneficio_funcionario` ADD FOREIGN KEY (`fk_id_tipo_beneficio`) REFERENCES `tb_tipo_beneficio` (`pk_id_tipo_beneficio`);

ALTER TABLE `tb_beneficio_funcionario` ADD FOREIGN KEY (`fk_id_funcionario`) REFERENCES `tb_funcionarios` (`pk_id_funcionario`);

ALTER TABLE `tb_folha_pagamento` ADD FOREIGN KEY (`fk_id_funcionario`) REFERENCES `tb_funcionarios` (`pk_id_funcionario`);

ALTER TABLE `tb_descontos_funcionarios` ADD FOREIGN KEY (`fk_id_ocorrencia`) REFERENCES `tb_ocorrencias_funcionario` (`pk_id_ocorrencia`);
