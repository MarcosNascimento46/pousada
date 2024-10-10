Feature: Gerenciamento de Hospede
  Como um Administrador
  Eu quero criar, remover, listar, visualizar, editar ou buscar um hospede
  Para que eu mantenha os hospedes atualizados

  Scenario: Criar um hospede
    Given estou na tela de criar hospede
    When eu preencho os campos com nome: "João da Silva", email: "joaosilva@example.com", telefone: "(11) 98765-4321", cpf: "12345678901"
    And clico em salvar
    Then eu devo ver a pagina do hospede "João da Silva"

  Scenario: Criar um hospede com CPF invalido
    Given estou na tela de criar hospede
    When eu preencho os campos com nome: "Maria Oliveira", cpf: "00000000000", telefone: "(21) 91234-5678", email: "mariaoliveira@example.com"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o CPF e invalido

  Scenario: Criar um hospede com email invalido
    Given estou na tela de criar hospede
    When eu preencho os campos com nome: "Lucas Martins", cpf: "12345678901", telefone: "(31) 98765-4321", email: "lucasmartins@invalido"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o email e invalido

  Scenario: Criar um hospede com telefone invalido
    Given estou na tela de criar hospede
    When eu preencho os campos com nome: "Ana Paula", cpf: "09876543210", telefone: "telefone_invalido", email: "anapaula@example.com"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o telefone e obrigatorio

  Scenario: Criar um hospede com nome invalido
    Given estou na tela de criar hospede
    When eu preencho os campos com nome: "A", cpf: "12345678901", telefone: "(21) 91234-5678", email: "anapaula@example.com"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o nome deve ter entre 2 e 30 caracteres
