class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2, :github, :facebook]


  mount_uploader :photo, AvatarUploader


  def self.from_omniauth(access_token)
    data = access_token.info

    user = User.where(provider: access_token['provider'], uid: access_token['uid']).first

    user ||= User.create(
      name: data.try(:[], 'name'), 
      email: data.try(:[], 'email') || "#{data.try(:[], 'nickname')}@todorails.com.br",
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.now 
    )

    user.update(remote_photo_url: data.try(:[], 'image')) if user.remote_photo_url.nil?
    user.update(provider: access_token['provider']) if user.provider.blank? 
    user.update(uid: access_token['uid']) if user.uid.blank? 
    
    user
  end

  def self.btn_provider(provider)
    icon = ''
    if provider == :google_oauth2
      icon = "<i class='bi bi-google'> Sign in with Google </i>"
    elsif provider == :github
      icon = "<i class='bi bi-github'> Sign in with GitHub </i>"
    elsif provider == :facebook
      icon = "<i class='bi bi-facebook'> Sign in with Facebook </i>"
    end

    icon
  end

  def self.bg_btn_provider(provider)
    icon = ''
    if provider == :google_oauth2
      icon = "btn btn-primary"
    elsif provider == :github
      icon = "btn btn-dark"
    elsif provider == :facebook
      icon = "btn btn-info"
    end
    
    icon
  end
end


