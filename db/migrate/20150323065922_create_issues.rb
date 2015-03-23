class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :message
      t.string :user
      t.string :headimg
      t.timestamps
    end
  end
end
