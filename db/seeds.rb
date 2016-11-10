require 'faker'

3.times do
  product = Product.new
  product.description =  Faker::Company.catch_phrase
  product.name = Faker::Commerce.product_name
  product.price = Faker::Commerce.price
  product.status = 1
  product.save!
end
