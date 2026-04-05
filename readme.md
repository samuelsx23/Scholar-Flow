# SisGESC - Sistema de Gestão Escolar (Scholar Flow)

## 📖 Sobre o Projeto
Este repositório contém a primeira entrega do projeto SisGESC[cite: 206]. [cite_start]O objetivo é modelar o banco de dados de um sistema de gestão educacional focado na realidade de uma Instituição de Ensino Superior privada[cite: 207, 208]. 

A arquitetura do banco de dados foi modelada para suportar a complexidade do ambiente universitário, onde os alunos se matriculam em cursos divididos por semestres, gerando uma malha de disciplinas e turmas. Além disso, o sistema foi desenhado com forte integração entre os setores Acadêmico, de Recursos Humanos e Financeiro. O objetivo é garantir a rastreabilidade total, desde a matrícula do aluno até o controle de seus contratos educacionais e da folha de pagamento corporativa.

## 🧩 Módulos do Sistema
O banco de dados está dividido em 4 grandes eixos:
1. **Módulo de Perfil e Acesso:** Centralização de identidade (CPF), contatos e credenciais exclusivas de login.
2. **Módulo Acadêmico:** Gestão do fluxo do aluno, englobando cursos, turmas, matrículas, notas e faltas.
3. **Módulo de Recursos Humanos:** Gestão de funcionários, professores, alocação de turmas, folha de pagamento, benefícios e ocorrências.
4. **Módulo Financeiro:** Controle de contratos educacionais e gestão de mensalidades estudantis.

## 🧠 Visão para BI e Inteligência Artificial
Pensando no futuro da instituição, este banco de dados foi modelado com foco em análise de dados (BI) e Inteligência Artificial. A estruturação permite o cruzamento de informações para decisões preventivas, tais como:
* **Previsão de Evasão:** Cruzamento do CEP do aluno com o registro de faltas e notas para gerar alertas automáticos de risco.
* **Análise de Inadimplência:** Histórico de status de pagamento nas mensalidades para prever fluxo de caixa e renegociações antecipadas.
* **Otimização Docente:** Cruzamento da alocação de professores com o desempenho das turmas para melhorar a montagem da grade.
* **Mapeamento de Diversidade:** Organização de dados sensíveis (etnia, gênero, deficiências) para relatórios rápidos do MEC e políticas de acessibilidade.

## 🚀 Estrutura do Repositório
* script_criacao_sisgesc: Script DDL contendo a criação de toda a estrutura do banco, chaves primárias/estrangeiras e restrições.
* docs: Pasta destinada ao armazenamento do Documento de Requisitos, DER e Dicionário de Dados.