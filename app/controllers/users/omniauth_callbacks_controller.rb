class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def github 
    @user = User.from_omniauth(request.env['omniauth.auth'])
    
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'GitHub'
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = 'There was a problem signing you in through GitHub. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

end