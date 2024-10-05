class CreateQuartos < ActiveRecord::Migration[7.2]
  def change
    create_table :quartos do |t|
      t.string :numero
      t.string :tipo
      t.text :descricao

      t.timestamps
    end
  end
end
