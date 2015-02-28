class RenameAssociationToCharityAssociation < ActiveRecord::Migration
  def change
    rename_table :associations, :charity_associations
  end
end
