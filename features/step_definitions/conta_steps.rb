# features/step_definitions/gerenciamento_conta_steps.rb

Given('estou na tela de criar conta de usuario') do
  visit new_user_path
  expect(page).to have_content('Cadastrar Conta de Usuário')
end

When('eu preencho os campos com nome: {string}, email: {string}, senha: {string}, tipo: {string}') do |nome, email, senha, tipo|
  fill_in 'user[nome]', with: nome
  fill_in 'user[email]', with: email
  fill_in 'user[senha]', with: senha
  select tipo, from: 'user[tipo]'
end

When('clico em salvar') do
  click_button 'Salvar'
end

Then('eu devo ver a pagina da conta de {string}') do |nome|
  expect(page).to have_content(nome)
end

When('eu preencho os campos com nome: {string}, email: {string}, senha: {string}, tipo: {string} e email invalido') do |nome, email, senha, tipo|
  fill_in 'user[nome]', with: nome
  fill_in 'user[email]', with: email
  fill_in 'user[senha]', with: senha
  select tipo, from: 'user[tipo]'
end

Then('eu devo ver uma mensagem de erro indicando que o email e invalido') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Email é inválido')
end

Given('que existe uma conta com o nome {string}') do |nome|
  User.create!(nome: nome, email: "#{nome.downcase.gsub(' ', '')}@example.com", senha: "senhaSegura123", tipo: "Administrador")
end

When('eu acesso a pagina de edicao da conta de {string}') do |nome|
  visit edit_user_path(User.find_by(nome: nome))
  expect(page).to have_content("Editar Conta de Usuário")
end

When('eu altero o email para {string}') do |novo_email|
  fill_in 'user[email]', with: novo_email
end

Then('eu devo ver a conta atualizada com o email {string}') do |email|
  expect(page).to have_content(email)
end

When('eu acesso a pagina de detalhes da conta de {string}') do |nome|
  visit user_path(User.find_by(nome: nome))
  expect(page).to have_content("Detalhes da Conta de Usuário")
end

When('clico em remover') do
  click_button 'Remover'
end

Then('eu devo ver uma mensagem confirmando que a conta foi removida com sucesso') do
  expect(page).to have_content('Conta removida com sucesso')
end

When('eu preencho os campos com nome: {string}, email: {string}, senha: "", tipo: {string}') do |nome, email, tipo|
  fill_in 'user[nome]', with: nome
  fill_in 'user[email]', with: email
  fill_in 'user[senha]', with: ''
  select tipo, from: 'user[tipo]'
end

Then('eu devo ver uma mensagem de erro indicando que a senha e obrigatoria') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Senha é obrigatória')
end
