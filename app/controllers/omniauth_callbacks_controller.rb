class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  #def callback
  #    omniauth=request.env['omniauth.auth']
  #   omniauth.credentials.token
  #   omniauth.credentials.secret
  #end
      
  def twitter
      @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
      #   	raise request.env['omniauth.auth'].to_yml

	if @user.persisted?
          sign_in_and_redirect_to root_path, notice: 'ログインしました'
	else
	  session["devise.user_attributes"] = @user.attributes
	  redirect_to new_user_registration_url, alert: 'ログインできませんでした'
	end
  end
end
