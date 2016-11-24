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


  it "sets total price to the qty times prices" do
    order_line = OrderLine.new({:qty => '5', :unit_price =>'20'})
    expect(order_line.total_price).to  eq(100)
  end





 end
