class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.string :name
      t.integer :nif
      t.string :city

      t.timestamps null: false
    end
  end
end
