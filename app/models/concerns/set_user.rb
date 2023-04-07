module SetUser 
    extend ActiveSupport::Concern 

    included do 
        default_scope lambda {
            User.current ? where(user_id: User.try(:current).try(:id)) : where({})
        }

        belongs_to :user,optional: true
        validates :user_id, presence: true, if: proc {|record| record.user_id.blank? }
    end
end