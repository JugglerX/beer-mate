class UpgradeRatings < ActiveRecord::Migration
  def change
    remove_column :beers, :rating, :integer
    remove_column :beers, :total_ratings, :integer
    add_column    :beers, :brewery_id, :integer
    add_column    :drinkers, :rating_id, :integer
  end
end
