class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :message
      t.integer :user_id
      t.string :good
      t.timestamps
    end
  end
end
