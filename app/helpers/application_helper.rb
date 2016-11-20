module ApplicationHelper
    
    def user_robotar(email)
        image_tag("https://robohash.org/#{email}.png/?size=128x128")
    end
    
    def down_grade(current_user)
        current_user.standard!
        flash[:notice] = "You just changed your account to standard!"
        redirect_to user_path(current_user)
    end
end
