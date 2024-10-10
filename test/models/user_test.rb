# test/models/user_test.rb

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'deve ser válido com atributos válidos' do
    user = User.new(email: 'usuario@example.com', password: 'senha123', role: 'admin')
    assert user.valid?
  end

  test 'não deve ser válido sem um email' do
    user = User.new(email: '', password: 'senha123', role: 'admin')
    assert_not user.valid?
  end

  test 'não deve ser válido com um email duplicado' do
    User.create(email: 'usuario@example.com', password: 'senha123', role: 'admin')
    user = User.new(email: 'usuario@example.com', password: 'senha456', role: 'funcionario')
    assert_not user.valid?
  end

  test 'não deve ser válido sem uma senha' do
    user = User.new(email: 'usuario@example.com', password: '', role: 'admin')
    assert_not user.valid?
  end

  test 'deve ser válido com um papel válido' do
    user = User.new(email: 'usuario@example.com', password: 'senha123', role: 'funcionario')
    assert user.valid?
  end
end
