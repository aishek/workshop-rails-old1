class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_categories do |t|
      t.string :title, null: false
    end

    add_column :articles, :category_id, :integer
  end
end
