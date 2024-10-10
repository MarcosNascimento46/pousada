# features/step_definitions/gerenciamento_reservas_steps.rb

Given('estou na tela de criar reserva') do
  visit new_reservation_path
  expect(page).to have_content('Cadastrar Reserva')
end

When('eu preencho os campos com nome do hospede: {string}, check_in: {string}, check_out: {string}') do |nome_hospede, check_in, check_out|
  fill_in 'reservation[nome_hospede]', with: nome_hospede
  fill_in 'reservation[check_in]', with: check_in
  fill_in 'reservation[check_out]', with: check_out
end

When('clico em salvar') do
  click_button 'Salvar'
end

Then('eu devo ver a pagina da reserva de {string}') do |nome_hospede|
  expect(page).to have_content("Reserva de #{nome_hospede}")
end

Then('eu devo ver uma mensagem de erro indicando que as datas sao invalidas') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('As datas são inválidas')
end

Then('eu devo ver uma mensagem de erro indicando que o check_in e obrigatorio') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Check-in é obrigatório')
end

Then('eu devo ver uma mensagem de erro indicando que o check_out e obrigatorio') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Check-out é obrigatório')
end

Then('eu devo ver uma mensagem de erro indicando que o hospede nao existe') do
  expect(page).to have_selector('.error-messages')
  expect(page).to have_content('Hospede não existe')
end
