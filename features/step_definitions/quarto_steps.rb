# Criar um quarto
Given('estou na tela de criar quarto') do
  visit new_quarto_path
  expect(page).to have_content('Cadastrar Quarto')
end

When('eu preencho os campos com numero: {string}, tipo: {string}, capacidade: {string}, valor_diaria: {string}') do |numero, tipo, capacidade, valor_diaria|
  fill_in 'quarto[numero]', with: numero
  fill_in 'quarto[tipo]', with: tipo
  fill_in 'quarto[capacidade]', with: capacidade
  fill_in 'quarto[valor_diaria]', with: valor_diaria
end

Then('eu devo ver a pagina do quarto numero {string}') do |numero|
  expect(page).to have_content(numero)
end

# Criar um quarto com numero repetido
When('eu preencho os campos com numero ja existente, tipo: {string}, capacidade: {string}, valor_diaria: {string}') do |tipo, capacidade, valor_diaria|
  fill_in 'quarto[numero]', with: '101' # Numero ja existente
  fill_in 'quarto[tipo]', with: tipo
  fill_in 'quarto[capacidade]', with: capacidade
  fill_in 'quarto[valor_diaria]', with: valor_diaria
end

Then('eu devo ver uma mensagem de erro indicando que o numero do quarto ja esta em uso') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Número do quarto já está em uso')
end
