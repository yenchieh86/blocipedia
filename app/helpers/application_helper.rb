module ApplicationHelper
    
    def user_robotar(email)
        image_tag("https://robohash.org/#{email}.png/?size=128x128")
    end
    
    def avatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=30"
    end
    
end
