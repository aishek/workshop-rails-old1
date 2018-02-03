class CreateArticleLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :article_links do |t|
      t.references :article, foreign_key: true
      t.text :url, null: false
      t.timestamps null: false
    end
  end
end
