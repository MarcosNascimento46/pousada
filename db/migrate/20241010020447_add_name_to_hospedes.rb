class AddNameToHospedes < ActiveRecord::Migration[7.2]
  def change
    add_column :hospedes, :name, :string
  end
end
