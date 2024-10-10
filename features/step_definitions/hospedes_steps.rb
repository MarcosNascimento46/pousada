# features/step_definitions/gerenciamento_quartos_steps.rb

Given('estou na tela de criar quarto') do
  visit new_room_path
  expect(page).to have_content('Cadastrar Quarto')
end

When('eu preencho os campos com numero: {string}, tipo: {string}, descricao: {string}') do |numero, tipo, descricao|
  fill_in 'room[numero]', with: numero
  fill_in 'room[tipo]', with: tipo
  fill_in 'room[descricao]', with: descricao
end

When('clico em salvar') do
  click_button 'Salvar'
end

Then('eu devo ver a pagina do quarto numero {string}') do |numero|
  expect(page).to have_content("Quarto ##{numero}")
end

When('eu preencho os campos com numero ja existente, tipo: {string}, descricao: {string}') do |tipo, descricao|
  fill_in 'room[numero]', with: '101' # número repetido
  fill_in 'room[tipo]', with: tipo
  fill_in 'room[descricao]', with: descricao
end

Then('eu devo ver uma mensagem de erro indicando que o numero do quarto ja esta em uso') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Número do quarto já está em uso')
end

When('eu preencho os campos com numero: {string}, tipo: {string}, descricao: {string}') do |numero, tipo, descricao|
  fill_in 'room[numero]', with: numero
  fill_in 'room[tipo]', with: tipo
  fill_in 'room[descricao]', with: descricao
end

Then('eu devo ver uma mensagem de erro indicando que o tipo e obrigatorio') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Tipo é obrigatório')
end

Then('eu devo ver uma mensagem de erro indicando que a descricao e obrigatoria') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Descrição é obrigatória')
end

Then('eu devo ver uma mensagem de erro indicando que o numero e obrigatorio') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Número é obrigatório')
end
