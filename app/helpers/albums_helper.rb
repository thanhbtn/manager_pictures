module AlbumsHelper
	def show_btn_edit_delete
		if @pictuers.first.album.user_id == current_user.id || current_user.admin?
			content_tag(:div, :nil,class:"btn-group",role:"group") do
				concat content_tag(:a,content_tag(:span,"" ,class:"glyphicon glyphicon-pencil"),
					class:"btn btn-default",data_toggle:"tooltip", title:"Edit", href:"#{edit_album_path(@pictuers.first.album)}")
				concat link_to(content_tag(:span,"",class:"glyphicon glyphicon-remove"), 
					@pictuers.first.album, method: :delete, data: { confirm: 'Are you sure?' },class:"btn btn-default")
			end
			
		end
	end
end
#content_tag(:a,content_tag(:span,"",class:"glyphicon glyphicon-remove"),
#					class:"btn btn-default",data_toggle:"tooltip", title:"Remove", href:"#{album_path(@pictuers.first.album)}",
#					 method: :delete, data: { confirm: 'Are you sure?' })
#