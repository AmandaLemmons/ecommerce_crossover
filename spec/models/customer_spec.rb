require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
     it { is_expected.to have_db_column(:email).of_type(:string) }
     it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
     it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
     it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
     it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
     it { is_expected.to have_db_column(:sign_in_count).of_type(:integer) }
     it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
     it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
     it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:inet) }
     it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:inet) }
     it { is_expected.to have_db_column(:firstname).of_type(:string) }
     it { is_expected.to have_db_column(:lastname).of_type(:string) }
   end

   describe "validations" do
     it { is_expected.to validate_presence_of(:firstname) }
     it { is_expected.to validate_presence_of(:lastname) }
     it { is_expected.to validate_presence_of(:email) }
     it { is_expected.to validate_presence_of(:password) }
   end

   describe "associations" do
     it { should have_many(:orders) }
   end
   #
  #  describe "secure password" do
  #    it { is_expected.to have_secure_password }
  #    it { is_expected.to validate_length_of(:password) }
   #
  #    it { expect(Customer.new({ firstname: "John", lastname: "Doe", email: "user@email.com", password: nil }).save).to be_falsey }
  #    it { expect(Customer.new({ firstname: "John", lastname: "Doe", email: "user@email.com", password: "foo" }).save).to be_falsey }
  #    it { expect(Customer.new({ firstname: "John", lastname: "Doe", email: "user@email.com", password: "af3714ff0ffae" }).save).to be_truthy }
  #  end
 end
