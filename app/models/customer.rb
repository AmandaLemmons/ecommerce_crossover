class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :orders
   validates_presence_of :firstname
   validates_presence_of :lastname
   validates_presence_of :email
   validates_presence_of :password, length: { minimum: 8 }



end
