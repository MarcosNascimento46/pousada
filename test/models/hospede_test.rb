# test/models/hospede_test.rb

require 'test_helper'

class HospedeTest < ActiveSupport::TestCase
  test 'deve ser válido com atributos válidos' do
    hospede = Hospede.new(nome: 'Ana Costa', email: 'ana@example.com', telefone: '1234567890')
    assert hospede.valid?
  end

  test 'não deve ser válido sem um nome' do
    hospede = Hospede.new(nome: '', email: 'ana@example.com', telefone: '1234567890')
    assert_not hospede.valid?
  end

  test 'não deve ser válido com um formato de email inválido' do
    hospede = Hospede.new(nome: 'Ana Costa', email: 'email_invalido', telefone: '1234567890')
    assert_not hospede.valid?
  end

  test 'não deve ser válido com um email duplicado' do
    Hospede.create(nome: 'Maria', email: 'maria@example.com', telefone: '1234567890')
    hospede = Hospede.new(nome: 'João', email: 'maria@example.com', telefone: '0987654321')
    assert_not hospede.valid?
  end

  test 'não deve ser válido sem um número de telefone' do
    hospede = Hospede.new(nome: 'Ana Costa', email: 'ana@example.com', telefone: '')
    assert_not hospede.valid?
  end
end
