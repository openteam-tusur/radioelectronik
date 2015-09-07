class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :number
      t.integer :global_id
      t.date :release_at
      t.timestamps null: false
    end
  end
end
