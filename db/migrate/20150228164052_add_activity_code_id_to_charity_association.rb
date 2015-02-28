class AddActivityCodeIdToCharityAssociation < ActiveRecord::Migration
  def change
    add_column :charity_associations, :activity_code_id, :integer
  end
end
