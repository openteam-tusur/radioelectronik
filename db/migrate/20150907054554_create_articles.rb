class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :article_type
      t.text :annotation
      t.text :content
      t.belongs_to :issue
      t.timestamps null: false
    end
  end
end
