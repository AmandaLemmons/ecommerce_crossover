class RegistrationsController < Devise::RegistrationsController

    def sign_up_params
     params.require(:customer).permit( :email, :password, :password_confirmation,:firstname, :lastname, :current_password)
   end

   private :sign_up_params
   private :account_update_params
end
