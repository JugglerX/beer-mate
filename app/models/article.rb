class Article < ActiveRecord::Base
  before_create :gen_key
  # before_create :create_sorted_word

  belongs_to :categories
  validates :title, presence: true
  # Remember to create a migration!

  def gen_key
    self.secret_key = Faker::Lorem.characters(10)
  end

  # def create_sorted_word
  #   sorted = self.word.downcase.chars.sort.join
  #   self.sorted_word = sorted
  # end

end
