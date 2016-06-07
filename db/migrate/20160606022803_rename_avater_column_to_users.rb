class RenameAvaterColumnToUsers < ActiveRecord::Migration
  def change
     rename_column :users, :avater, :avatar
  end
end
