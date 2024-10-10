json.extract! funcionario, :id, :nome, :cargo, :cpf, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
