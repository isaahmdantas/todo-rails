class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :set_current_user 
    after_action :unset_current_user 



    private 
        def set_current_user 
            User.current = current_user 
        end

        def unset_current_user 
            User.current = nil 
        end
end