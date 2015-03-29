class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :path
      t.integer :photobook_id
      t.timestamps
    end
  end
end
