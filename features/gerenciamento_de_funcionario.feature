Feature: Gerenciamento de Funcionario
  Como um Administrador
  Eu quero criar, remover, listar, visualizar, editar ou buscar um funcionario
  Para que eu mantenha os funcionarios atualizados

  Scenario: Criar um funcionario
    Given estou na tela de criar funcionario
    When eu preencho os campos com nome: "Carlos Souza", cpf: "98765432109", telefone: "(31) 99876-5432", email: "carlossouza@example.com", cargo: "Recepcionista"
    And clico em salvar
    Then eu devo ver a pagina do funcionario "Carlos Souza"

  Scenario: Criar um funcionario com nome invalido
    Given estou na tela de criar funcionario
    When eu preencho os campos sem nome, cpf: "78945612300", telefone: "(41) 93456-7890", email: "funcionariosemnome@example.com", cargo: "Gerente"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o nome e obrigatorio

  Scenario: Criar um funcionario com CPF invalido
    Given estou na tela de criar funcionario
    When eu preencho os campos com nome: "Fernanda Lima", cpf: "123456", telefone: "(51) 91234-5678", email: "fernandalima@example.com", cargo: "Assistente"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o CPF deve ter 11 dígitos numéricos

  Scenario: Criar um funcionario com email invalido
    Given estou na tela de criar funcionario
    When eu preencho os campos com nome: "Pedro Almeida", cpf: "23456789012", telefone: "(21) 98765-4321", email: "pedroalmeida@invalido", cargo: "Gerente"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o email e invalido

  Scenario: Criar um funcionario com cargo invalido
    Given estou na tela de criar funcionario
    When eu preencho os campos com nome: "Juliana Silva", cpf: "34567890123", telefone: "(41) 93456-7890", email: "julianasilva@example.com", cargo: ""
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o cargo e obrigatorio
