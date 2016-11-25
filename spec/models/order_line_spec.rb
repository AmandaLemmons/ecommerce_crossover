require 'rails_helper'


RSpec.describe OrderLine, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
     it { is_expected.to have_db_column(:order_id).of_type(:integer) }
     it { is_expected.to have_db_column(:product_id).of_type(:integer) }
     it { is_expected.to have_db_column(:qty).of_type(:integer) }
     it { is_expected.to have_db_column(:unit_price).of_type(:decimal) }
     it { is_expected.to have_db_column(:total_price).of_type(:decimal) }
   end

   describe "associations" do
     it { should belong_to(:order) }
     it { should belong_to(:product) }
   end


  it "sets total price" do
    order_line = OrderLine.new({:qty => '5', :unit_price =>'20'})
    expect(order_line.total_price).to  eq(100)
  end

  it "has a valid order and product" do
    product = Product.create({:description => "wooden table", :name => "Table", :price => "20,"})
    order = Order.create({:customer_id => '1', :total => nil, :date => Date.today, :status => 1})
    order_line = OrderLine.new({:order_id => order.id, :product_id => product.id,  :qty => '5', :unit_price =>'20', :total_price => nil })

    expect(order_line).to be_valid
  end

  it "has a doesn't have a valid order" do
    order_line = OrderLine.new({:order_id => nil, :product_id => '3',  :qty => '5', :unit_price =>'20', :total_price => nil })
    expect(order_line).to_not be_valid
  end

  # it "has a doesn't have a valid product" do
  #   order_line = OrderLine.new({:order_id => '4', :product_id => nil,  :qty => '5', :unit_price =>'20', :total_price => nil })
  #   expect(order_line).to_not be_valid
  # end

  # it "has a valid unit price if created with unit price" do
  #   order_line = OrderLine.new({:order_id => '4', :product_id => nil,  :qty => '5', :unit_price =>'20', :total_price => nil })
  #   expect(order_line.unit_price).to be_valid
  # end

  # it "has a uses product unit price if created without unit price" do
  #
  #   product = Product.create({:description => "wooden table", :name => "Table", :price => "20,"})
  #   order_line = OrderLine.new({:order_id => '4', :product_id => product.id,  :qty => '5', :unit_price => nil, :total_price => nil })
  #
  #   expect(order_line.unit_price).to be_valid
  # end








 end
