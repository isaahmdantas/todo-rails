class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]


  mount_uploader :photo, AvatarUploader


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(name: data['name'], email: data['email'],password: Devise.friendly_token[0, 20])

    user.update(remote_photo_url: data.try(:[], 'image')) if user.remote_photo_url.nil?
    
    user
  end

  def self.btn_provider(provider)
    icon = ''
    if provider == :google_oauth2
      icon = "<i class='bi bi-google'> Sign in with Google </i>"
    end

    icon
  end
end