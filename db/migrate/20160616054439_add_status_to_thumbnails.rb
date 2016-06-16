class AddStatusToThumbnails < ActiveRecord::Migration
  def change
    add_column :thumbnails, :status, :integer, default: 0, null: false, limit: 1
  end
end
