class CreateCaes < ActiveRecord::Migration
  def change
    create_table :caes do |t|
      t.integer :code
      t.string :name

      t.timestamps null: false
    end
  end
end
