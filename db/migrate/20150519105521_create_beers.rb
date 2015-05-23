class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :title
      t.string :abv
      t.string :ibu
      t.string :description
      t.string :image
      t.integer :rating, :default => 0
      t.integer :total_ratings, :default => 0
      # t.references :beers_user
      t.timestamps
    end
  end
end
