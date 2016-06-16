class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|

      t.references :user
      t.string :title
      t.text :catchcopy
      t.text :concept

      t.timestamps
    end
  end
end
