class Category < ActiveRecord::Base
  has_many :articles
  # Remember to create a migration!
end
