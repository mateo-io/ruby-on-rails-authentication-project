module ApplicationHelper
	include SessionsHelper
	def full_title(param="")
		if param.blank?
			return "Gossip City"
		else
			return "#{param}  |  Gossip City"
		end
	end
end
