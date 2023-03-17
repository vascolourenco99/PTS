class AddCellphoneToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :Cellphone, :string
  end
end
