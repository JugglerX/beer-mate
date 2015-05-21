cate_array = [Category.create(name: "Auto"),
Category.create(name: "Garden"),
Category.create(name: "Apartments"),
Category.create(name: "Kitchen"),
Category.create(name: "Restaurants")]


40.times do
Article.create(title: Faker::Commerce.product_name, description: Faker::Lorem.paragraph(2), price: Faker::Commerce.price.to_i, author_email: Faker::Internet.safe_email, secret_key: Faker::Lorem.characters(10), category_id: cate_array.sample.id)
end
