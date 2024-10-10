# test/models/reserva_test.rb

require 'test_helper'

class ReservaTest < ActiveSupport::TestCase
  test 'deve ser válido com atributos válidos' do
    hospede = Hospede.create(nome: 'João', email: 'joao@example.com', telefone: '1234567890')
    quarto = Quarto.create(numero: '101', tipo: 'Suíte', descricao: 'Quarto confortável')
    reserva = Reserva.new(hospede: hospede, quarto: quarto, check_in: '2024-10-15', check_out: '2024-10-20')
    assert reserva.valid?
  end

  test 'não deve ser válido sem uma data de check_in' do
    reserva = Reserva.new(check_in: nil, check_out: '2024-10-20')
    assert_not reserva.valid?
  end

  test 'não deve ser válido sem uma data de check_out' do
    reserva = Reserva.new(check_in: '2024-10-15', check_out: nil)
    assert_not reserva.valid?
  end

  test 'não deve ser válido se o check_out for anterior ao check_in' do
    hospede = Hospede.create(nome: 'João', email: 'joao@example.com', telefone: '1234567890')
    quarto = Quarto.create(numero: '101', tipo: 'Suíte', descricao: 'Quarto confortável')
    reserva = Reserva.new(hospede: hospede, quarto: quarto, check_in: '2024-10-20', check_out: '2024-10-15')
    assert_not reserva.valid?
  end

  test 'não deve ser válido sem um hóspede' do
    quarto = Quarto.create(numero: '101', tipo: 'Suíte', descricao: 'Quarto confortável')
    reserva = Reserva.new(hospede: nil, quarto: quarto, check_in: '2024-10-15', check_out: '2024-10-20')
    assert_not reserva.valid?
  end
end
