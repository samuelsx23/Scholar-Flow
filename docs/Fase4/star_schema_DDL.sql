SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS fato_financeiro;
DROP TABLE IF EXISTS fato_perfil_social;
DROP TABLE IF EXISTS fato_evasao;
DROP TABLE IF EXISTS fato_desempenho_academico;

DROP TABLE IF EXISTS dim_tempo;
DROP TABLE IF EXISTS dim_status_pagamento;
DROP TABLE IF EXISTS dim_disciplina;
DROP TABLE IF EXISTS dim_curso;
DROP TABLE IF EXISTS dim_aluno;
DROP TABLE IF EXISTS dim_localizacao;
DROP TABLE IF EXISTS dim_genero;
DROP TABLE IF EXISTS dim_etnia;
DROP TABLE IF EXISTS dim_deficiencia;

SET FOREIGN_KEY_CHECKS = 1;



CREATE TABLE dim_aluno ( 
    sk_aluno INT PRIMARY KEY AUTO_INCREMENT, 
    id_aluno INT, 
    cpf CHAR(11), 
    nome VARCHAR(50), 
    genero VARCHAR(50),
    etnia VARCHAR(50), 
    cidade VARCHAR(50), 
    uf CHAR(2)  
); 

CREATE TABLE dim_curso ( 
    sk_curso INT PRIMARY KEY AUTO_INCREMENT, 
    id_curso INT, 
    nome_curso VARCHAR(50) 
); 

CREATE TABLE dim_disciplina ( 
    sk_disciplina INT PRIMARY KEY AUTO_INCREMENT, 
    id_disciplina INT, 
    nome_disciplina VARCHAR(100) 
); 

CREATE TABLE dim_status_pagamento ( 
    sk_status INT PRIMARY KEY AUTO_INCREMENT, 
    status_pagamento VARCHAR(20) 
); 

CREATE TABLE dim_localizacao ( 
    sk_localizacao INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(50), 
    uf CHAR(2), 
    bairro VARCHAR(30) 
); 

CREATE TABLE dim_genero ( 
    sk_genero INT PRIMARY KEY AUTO_INCREMENT, 
    tipo_genero VARCHAR(50) 
);

CREATE TABLE dim_etnia ( 
    sk_etnia INT PRIMARY KEY AUTO_INCREMENT, 
    tipo_etnia VARCHAR(50) 
); 

CREATE TABLE dim_deficiencia ( 
    sk_deficiencia INT PRIMARY KEY AUTO_INCREMENT, 
    tipo_deficiencia VARCHAR(50) 
); 

CREATE TABLE dim_tempo ( 
    sk_tempo INT PRIMARY KEY AUTO_INCREMENT, 
    data_completa DATE, 
    dia INT, 
    mes INT, 
    ano INT, 
    semestre VARCHAR(10), 
    trimestre INT, 
    nome_mes VARCHAR(20) 
); 




CREATE TABLE fato_desempenho_academico ( 
    sk_fato INT PRIMARY KEY AUTO_INCREMENT, 
    fk_aluno INT, 
    fk_curso INT, 
    fk_disciplina INT, 
    fk_tempo INT, 
    fk_status INT, 
    valor_nota DECIMAL(4,2), 
    quantidade_faltas INT, 
    valor_parcela DECIMAL(10,2), 
    FOREIGN KEY (fk_aluno) REFERENCES dim_aluno(sk_aluno), 
    FOREIGN KEY (fk_curso) REFERENCES dim_curso(sk_curso), 
    FOREIGN KEY (fk_disciplina) REFERENCES dim_disciplina(sk_disciplina), 
    FOREIGN KEY (fk_tempo) REFERENCES dim_tempo(sk_tempo), 
    FOREIGN KEY (fk_status) REFERENCES dim_status_pagamento(sk_status) 
);


CREATE TABLE fato_evasao ( 
    sk_evasao INT PRIMARY KEY AUTO_INCREMENT, 
    fk_aluno INT, 
    fk_curso INT, 
    fk_tempo INT, 
    fk_localizacao INT, 
    media_notas DECIMAL(4,2), 
    quantidade_faltas INT, 
    percentual_presenca DECIMAL(5,2), 
    risco_evasao VARCHAR(20), 
    FOREIGN KEY (fk_aluno) REFERENCES dim_aluno(sk_aluno), 
    FOREIGN KEY (fk_curso) REFERENCES dim_curso(sk_curso), 
    FOREIGN KEY (fk_tempo) REFERENCES dim_tempo(sk_tempo), 
    FOREIGN KEY (fk_localizacao) REFERENCES dim_localizacao(sk_localizacao) 
); 


CREATE TABLE fato_perfil_social ( 
    sk_perfil_social INT PRIMARY KEY AUTO_INCREMENT, 
    fk_aluno INT, 
    fk_genero INT, 
    fk_etnia INT, 
    fk_deficiencia INT, 
    fk_tempo INT, 
    idade INT, 
    possui_deficiencia BOOLEAN, 
    quantidade_alunos INT, 
    FOREIGN KEY (fk_aluno) REFERENCES dim_aluno(sk_aluno), 
    FOREIGN KEY (fk_genero) REFERENCES dim_genero(sk_genero), 
    FOREIGN KEY (fk_etnia) REFERENCES dim_etnia(sk_etnia), 
    FOREIGN KEY (fk_deficiencia) REFERENCES dim_deficiencia(sk_deficiencia), 
    FOREIGN KEY (fk_tempo) REFERENCES dim_tempo(sk_tempo) 
); 


CREATE TABLE fato_financeiro ( 
    sk_financeiro INT PRIMARY KEY AUTO_INCREMENT, 
    fk_aluno INT, 
    fk_curso INT, 
    fk_tempo INT, 
    fk_status INT, 
    valor_parcela DECIMAL(10,2), 
    valor_total_contrato DECIMAL(10,2), 
    quantidade_parcelas INT, 
    FOREIGN KEY (fk_aluno) REFERENCES dim_aluno(sk_aluno), 
    FOREIGN KEY (fk_curso) REFERENCES dim_curso(sk_curso), 
    FOREIGN KEY (fk_tempo) REFERENCES dim_tempo(sk_tempo), 
    FOREIGN KEY (fk_status) REFERENCES dim_status_pagamento(sk_status) 
);