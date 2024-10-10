Feature: Gerenciamento de Quartos
  Como um Administrador
  Eu quero criar, remover, listar, visualizar, editar ou buscar um quarto da pousada
  Para que eu mantenha os quartos e suas caracteristicas atualizadas

  Scenario: Criar um quarto
    Given estou na tela de criar quarto
    When eu preencho os campos com numero: "101", tipo: "Suite", descricao: "Suite com vista para o mar"
    And clico em salvar
    Then eu devo ver a pagina do quarto numero "101"

  Scenario: Criar um quarto com numero repetido
    Given estou na tela de criar quarto
    When eu preencho os campos com numero ja existente, tipo: "Quarto Duplo", descricao: "Quarto duplo confortavel"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o numero do quarto ja esta em uso

  Scenario: Criar um quarto com tipo invalido
    Given estou na tela de criar quarto
    When eu preencho os campos com numero: "102", tipo: "", descricao: "Quarto simples"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o tipo e obrigatorio

  Scenario: Criar um quarto sem descricao
    Given estou na tela de criar quarto
    When eu preencho os campos com numero: "103", tipo: "Suite", descricao: ""
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que a descricao e obrigatoria

  Scenario: Criar um quarto com numero invalido
    Given estou na tela de criar quarto
    When eu preencho os campos com numero: "", tipo: "Suite", descricao: "Quarto elegante"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o numero e obrigatorio
