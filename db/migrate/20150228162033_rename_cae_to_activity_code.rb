class RenameCaeToActivityCode < ActiveRecord::Migration
  def change
    rename_table :caes, :activity_codes
  end
end
