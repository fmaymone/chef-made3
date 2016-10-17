module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase 
		if user.image
			user.image
		else
			"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?"
		end
	end
	
	 def isAdmin(user)
         puts "66666666666666666666666666666666666666666666666666"
         puts user.email
         puts "66666666666666666666666666666666666666666666666666"
         @retorno = AdminUser.where(email: user.email)
       
         @retorno.size > 0 ? true : false
        
        
    end
	
end
