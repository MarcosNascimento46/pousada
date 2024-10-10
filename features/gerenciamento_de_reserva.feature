Feature: Gerenciamento de Reserva
  Como um Funcionario
  Eu quero criar, remover, listar, visualizar, editar ou buscar uma reserva
  Para que eu mantenha as reservas dos hospedes atualizadas

  Scenario: Criar uma reserva
    Given estou na tela de criar reserva
    When eu preencho os campos com nome do hospede: "Joao da Silva", check_in: "15-10-2024", check_out: "20-10-2024"
    And clico em salvar
    Then eu devo ver a pagina da reserva de "Joao da Silva"

  Scenario: Criar uma reserva com datas invalidas
    Given estou na tela de criar reserva
    When eu preencho os campos com nome do hospede: "Maria Oliveira", check_in: "25-10-2024", check_out: "20-10-2024"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que as datas sao invalidas

  Scenario: Criar uma reserva sem check_in
    Given estou na tela de criar reserva
    When eu preencho os campos com nome do hospede: "Carlos Santos", check_in: "", check_out: "20-10-2024"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o check_in e obrigatorio

  Scenario: Criar uma reserva sem check_out
    Given estou na tela de criar reserva
    When eu preencho os campos com nome do hospede: "Ana Costa", check_in: "15-10-2024", check_out: ""
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o check_out e obrigatorio

  Scenario: Criar uma reserva com hospede inexistente
    Given estou na tela de criar reserva
    When eu preencho os campos com nome do hospede: "Hospede Inexistente", check_in: "15-10-2024", check_out: "20-10-2024"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o hospede nao existe