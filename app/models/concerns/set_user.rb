module SetUser 
    extend ActiveSupport::Concern 

    included do 
        default_scope -> { where(user_id: User.current.id) }

        belongs_to :user,optional: true
        validates :user_id, presence: true, if: proc {|record| record.user_id.blank? }
    end
end