module App
    class UsersController < AppController
        before_action :set_user, only: %i[ show edit update profile update_password]

        # GET /users/1
        def show;end

        # GET /users/1/edit
        def edit
            set_socials(@user) if @user.socials.blank?
        end

        #  GET /users/1/profile
        def profile
            set_socials(@user) if @user.socials.blank?
        end

        # PATCH/PUT /users/1 or /users/1.json
        def update
            respond_to do |format|
                if @user.update(user_params)
                    format.html { redirect_to profile_app_user_url(@user), notice: "User was successfully updated." }
                    format.json { render :show, status: :ok, location: @user }
                else
                    format.html { render :profile, status: :unprocessable_entity }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                end
            end
        end

        # POST /users/1/update_password
        def update_password
            respond_to do |format|
                if @user.update(password_params)
                    format.html { redirect_to profile_app_user_url(@user), notice: "User was successfully updated." }
                    format.json { render :show, status: :ok, location: @user }
                else
                    format.html { render :profile, status: :unprocessable_entity }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                end
            end
        end

        private 
            def set_user 
                @user = User.find(params[:id])
            end

            def set_socials(user) 
                if user.socials.blank? 
                    Social.icons.each do |icon|
                        user.socials << Social.new(name: icon[0].capitalize, icon: icon[0], url: "https://#{icon[0]}.com/#{user.name.parameterize}")
                    end
                end        
            end

            def user_params
                params.require(:user).permit(
                    :email,
                    :name,
                    :photo,
                    :username,
                    :about,
                    :phone,
                    :address,
                    socials_attributes: [
                        :id,
                        :name, 
                        :url,
                        :icone,
                        :_destroy
                    ]
                )
            end

            def password_params
                params.require(:user).permit(
                    :current_password,
                    :password,
                    :password_confirmation 
                )
            end
    end
end


