# features/step_definitions/gerenciamento_funcionario_steps.rb

Given('estou na tela de criar funcionario') do
  visit new_employee_path
  expect(page).to have_content('Cadastrar Funcionário')
end

When('eu preencho os campos com nome: {string}, cpf: {string}, telefone: {string}, email: {string}, cargo: {string}') do |nome, cpf, telefone, email, cargo|
  fill_in 'employee[nome]', with: nome
  fill_in 'employee[cpf]', with: cpf
  fill_in 'employee[telefone]', with: telefone
  fill_in 'employee[email]', with: email
  fill_in 'employee[cargo]', with: cargo
end

When('clico em salvar') do
  click_button 'Salvar'
end

Then('eu devo ver a pagina do funcionario {string}') do |nome|
  expect(page).to have_content(nome)
end

When('eu preencho os campos sem nome, cpf: {string}, telefone: {string}, email: {string}, cargo: {string}') do |cpf, telefone, email, cargo|
  fill_in 'employee[cpf]', with: cpf
  fill_in 'employee[telefone]', with: telefone
  fill_in 'employee[email]', with: email
  fill_in 'employee[cargo]', with: cargo
end

Then('eu devo ver uma mensagem de erro indicando que o nome e obrigatorio') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Nome é obrigatório')
end

When('eu preencho os campos com nome: {string}, cpf: {string}, telefone: {string}, email: {string}, cargo: ""') do |nome, cpf, telefone, email|
  fill_in 'employee[nome]', with: nome
  fill_in 'employee[cpf]', with: cpf
  fill_in 'employee[telefone]', with: telefone
  fill_in 'employee[email]', with: email
  fill_in 'employee[cargo]', with: ''
end

Then('eu devo ver uma mensagem de erro indicando que o CPF deve ter 11 dígitos numéricos') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('CPF deve ter 11 dígitos numéricos')
end

Then('eu devo ver uma mensagem de erro indicando que o email e invalido') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Email é inválido')
end

Then('eu devo ver uma mensagem de erro indicando que o cargo e obrigatorio') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Cargo é obrigatório')
end
