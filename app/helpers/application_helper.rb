module ApplicationHelper
	def checklogin
		if current_user.admin?
			content_tag(:li, link_to('Manager users', users_index_path))
			tag("li", role:"separator",class: "divider")
		end
	end
end
 