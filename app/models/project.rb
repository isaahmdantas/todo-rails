class Project < ApplicationRecord
  include SetUser 

  enum view: {list: 'list',panel: 'panel'}

  validates :name, presence: true 
end
