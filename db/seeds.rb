User.create(
  first_name: "robert",
  last_name: "austin",
  email: "rob@jugglerdigital.com",
  username: "rob",
  password: "rob"
)

User.create(
  first_name: "sherif",
  last_name: "ambusudo",
  email: "sherif@jugglerdigital.com",
  username: "sherif",
  password: "sherif"
)

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: Faker::Internet.password
  )
end
40.times do
  Beer.create(
    title: Faker::Commerce.product_name,
    abv: Faker::Number.digit,
    ibu: Faker::Number.digit,
    description: Faker::Lorem.paragraph(2),
    image: Faker::Company.logo
    # rating: Faker::Number.digit,
    # total_ratings: Faker::Number.digit
  )
end


Drinker.create(beer_id: 1, user_id: 1)
Rating.create(rating: 3, user_id: 1, beer_id: 1)
Drinker.create(beer_id: 2, user_id: 1)
Rating.create(rating: 5, user_id: 1, beer_id: 2)
Drinker.create(beer_id: 3, user_id: 1)
Rating.create(rating: 1, user_id: 1, beer_id: 3)
Drinker.create(beer_id: 4, user_id: 1)
Rating.create(rating: 2, user_id: 1, beer_id: 4)
Drinker.create(beer_id: 5, user_id: 1)
Rating.create(rating: 3, user_id: 1, beer_id: 5)


Drinker.create(beer_id: 1, user_id: 2)
Rating.create(rating: 2, user_id: 2, beer_id: 1)
Drinker.create(beer_id: 2, user_id: 2)
Rating.create(rating: 5, user_id: 2, beer_id: 2)
Drinker.create(beer_id: 3, user_id: 2)
Rating.create(rating: 5, user_id: 2, beer_id: 3)
Drinker.create(beer_id: 4, user_id: 2)
Rating.create(rating: 2, user_id: 2, beer_id: 4)
Drinker.create(beer_id: 5, user_id: 2)
Rating.create(rating: 2, user_id: 2, beer_id: 5)
