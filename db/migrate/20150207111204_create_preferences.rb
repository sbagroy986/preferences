class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :name
      t.integer :order
      t.integer :enable

      t.timestamps
    end
  end
end
