class Product < ActiveRecord::Base
  has_many :order_lines
end
