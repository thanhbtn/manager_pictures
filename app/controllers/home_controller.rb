class HomeController < ApplicationController
	before_action :redirect_login

	#def index
	#  @pictuers = Pictuer.get_pictuer_public
	#end


  def index
    @albums = Album.get_album_public.paginate(page:params[:page])
  end

  def change_locale
  	 if params[:locale].nil?
      session[:locale] = I18n.default_locale
    else
      session[:locale] = params[:locale]
    end
    redirect_to root_path
  end
end
