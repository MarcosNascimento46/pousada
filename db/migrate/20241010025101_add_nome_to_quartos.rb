class AddNomeToQuartos < ActiveRecord::Migration[7.2]
  def change
    add_column :quartos, :nome, :string
  end
end
