class AddCategoryToActivityCodes < ActiveRecord::Migration
  def change
    add_column :activity_codes, :category_id, :integer
  end
end
