class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :description, :author_email, :secret_key
      t.integer :price
      t.integer :category_id
      t.timestamps
    end
  end
end
