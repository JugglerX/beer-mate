class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|

      t.string :title
      t.string :abv
      t.string :ibu
      t.string :description
      t.string :image

      t.integer :brewery_id

      t.timestamps

    end
  end
end
