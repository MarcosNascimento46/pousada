# test/models/quarto_test.rb

require 'test_helper'

class QuartoTest < ActiveSupport::TestCase
  test 'deve ser válido com atributos válidos' do
    quarto = Quarto.new(numero: '101', tipo: 'Suíte', descricao: 'Quarto confortável')
    assert quarto.valid?
  end

  test 'não deve ser válido sem um número' do
    quarto = Quarto.new(numero: '', tipo: 'Suíte', descricao: 'Quarto confortável')
    assert_not quarto.valid?
  end

  test 'não deve ser válido com um número duplicado' do
    Quarto.create(numero: '101', tipo: 'Suíte', descricao: 'Quarto confortável')
    quarto = Quarto.new(numero: '101', tipo: 'Quarto Duplo', descricao: 'Quarto aconchegante')
    assert_not quarto.valid?
  end

  test 'não deve ser válido sem um tipo' do
    quarto = Quarto.new(numero: '102', tipo: '', descricao: 'Quarto aconchegante')
    assert_not quarto.valid?
  end

  test 'não deve ser válido sem uma descrição' do
    quarto = Quarto.new(numero: '102', tipo: 'Quarto Duplo', descricao: '')
    assert_not quarto.valid?
  end
end
