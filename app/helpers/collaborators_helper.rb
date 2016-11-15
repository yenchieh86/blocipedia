module CollaboratorsHelper
    
    def collaborator_email(user_id)
        user = User.find(user_id)
        email = user.email
        email
    end
    
end
