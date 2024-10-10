# test/models/funcionario_test.rb

require 'test_helper'

class FuncionarioTest < ActiveSupport::TestCase
  test 'deve ser válido com atributos válidos' do
    funcionario = Funcionario.new(nome: 'Carlos Silva', cargo: 'Gerente', cpf: '12345678901')
    assert funcionario.valid?
  end

  test 'não deve ser válido sem um nome' do
    funcionario = Funcionario.new(nome: '', cargo: 'Gerente', cpf: '12345678901')
    assert_not funcionario.valid?
  end

  test 'não deve ser válido sem um cargo' do
    funcionario = Funcionario.new(nome: 'Carlos Silva', cargo: '', cpf: '12345678901')
    assert_not funcionario.valid?
  end

  test 'não deve ser válido com um CPF duplicado' do
    Funcionario.create(nome: 'João', cargo: 'Analista', cpf: '12345678901')
    funcionario = Funcionario.new(nome: 'Maria', cargo: 'Gerente', cpf: '12345678901')
    assert_not funcionario.valid?
  end

  test 'não deve ser válido se o CPF não tiver 11 dígitos' do
    funcionario = Funcionario.new(nome: 'Carlos Silva', cargo: 'Gerente', cpf: '123456')
    assert_not funcionario.valid?
  end
end
