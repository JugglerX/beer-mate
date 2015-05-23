class User  < ActiveRecord::Base
  include BCrypt

  before_create do
    password
  end

  has_many :drinkers
  has_many :beers, :through => :drinkers

   def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
