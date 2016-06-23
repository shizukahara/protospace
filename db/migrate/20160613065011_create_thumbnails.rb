class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.references :prototype
      t.text :image_url

      t.timestamps
    end
  end
end
