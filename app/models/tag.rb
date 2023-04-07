class Tag < ApplicationRecord
  include SetUser 
 
  validates :name, presence: true 
end
