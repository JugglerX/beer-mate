class CreateDrinkers < ActiveRecord::Migration
  def change
    create_table :drinkers do |t|

      t.integer :beer_id
      t.integer :user_id

      t.timestamps

    end
  end
end
