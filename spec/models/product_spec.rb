require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:description).of_type(:string) }
     it { is_expected.to have_db_column(:name).of_type(:string) }
     it { is_expected.to have_db_column(:price).of_type(:decimal) }
     it { is_expected.to have_db_column(:status).of_type(:boolean) }
   end


   describe "associations" do
     it { should have_many(:order_lines) }
   end
 end
