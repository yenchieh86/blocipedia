module ApplicationHelper
    
    def user_robotar(email)
        image_tag("https://robohash.org/#{email}.png/?size=128x128")
    end
end
