require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:order_no).of_type(:string) }
     it { is_expected.to have_db_column(:customer_id).of_type(:integer) }
     it { is_expected.to have_db_column(:total).of_type(:decimal) }
     it { is_expected.to have_db_column(:date).of_type(:date) }
     it { is_expected.to have_db_column(:status).of_type(:integer) }
   end


   describe "associations" do
     it { should have_many(:order_lines) }
   end
 end
