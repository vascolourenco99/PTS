class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :address
      t.datetime :date
      t.references :event
      t.timestamps
    end
  end
end
