class Social < ApplicationRecord
  include SetUser 

  enum icon: {twitter: 'twitter', facebook: 'facebook', instagram: 'instagram', linkedin: 'linkedin'}

  validates :url, :icon, presence: true 
end
