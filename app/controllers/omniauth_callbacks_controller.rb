class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))

        if @user.persisted?
            sign_in_and_redirect @user
        else
            session["devise.user_attributes"] = @user.attributes
            redirect_to new_user_registration_url
        end
    end
    # def twitter
    # @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    #   if @user.persisted?
    #     set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    #     sign_in_and_redirect @user, :event => :authentication
    #   else
    #     session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
    #     redirect_to new_user_registration_url
    #   end
    # end

end