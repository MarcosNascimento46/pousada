Feature: Gerenciamento de Conta
  Como um Administrador
  Eu quero criar, remover, listar, visualizar, editar ou buscar uma conta de usuario
  Para que eu mantenha as contas atualizadas

  Scenario: Criar uma conta de usuario
    Given estou na tela de criar conta de usuario
    When eu preencho os campos com nome: "Lucas Almeida", email: "lucasalmeida@example.com", senha: "senhaSegura123", tipo: "Administrador"
    And clico em salvar
    Then eu devo ver a pagina da conta de "Lucas Almeida"

  Scenario: Criar uma conta de usuario com email invalido
    Given estou na tela de criar conta de usuario
    When eu preencho os campos com nome: "Paula Souza", email: "email_invalido", senha: "senha123", tipo: "Funcionario"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que o email e invalido

  Scenario: Editar uma conta de usuario existente
    Given que existe uma conta com o nome "Lucas Almeida"
    When eu acesso a pagina de edicao da conta de "Lucas Almeida"
    And eu altero o email para "lucasalmeida_novo@example.com"
    And clico em salvar
    Then eu devo ver a conta atualizada com o email "lucasalmeida_novo@example.com"

  Scenario: Remover uma conta de usuario
    Given que existe uma conta com o nome "Lucas Almeida"
    When eu acesso a pagina de detalhes da conta de "Lucas Almeida"
    And clico em remover
    Then eu devo ver uma mensagem confirmando que a conta foi removida com sucesso

  Scenario: Tentar criar uma conta sem senha
    Given estou na tela de criar conta de usuario
    When eu preencho os campos com nome: "Joana Pereira", email: "joanapereira@example.com", senha: "", tipo: "Administrador"
    And clico em salvar
    Then eu devo ver uma mensagem de erro indicando que a senha e obrigatoria
