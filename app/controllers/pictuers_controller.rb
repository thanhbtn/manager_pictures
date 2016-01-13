class PictuersController < ApplicationController

	#before_action :pictuer_params, only: [:create]
	before_action :redirect_login
	def index
		@pictuers = Pictuer.get_pictuers_by_id_album(params[:album_id]).paginate(page:params[:page])
	end

	def new
	 	@pictuer = Pictuer.new
	end

	def create
		@pictuer = Pictuer.new(pictuer_params)
		p current_user
		@pictuer.user_id =  current_user.id
	    respond_to do |format|
	      if @pictuer.save
	        format.html { redirect_to root_url}
	        #format.json { render :show, status: :created, location: @list }
	      else
	        format.html { render :new }
	        format.json { render json: @pictuer.errors, status: :unprocessable_entity }
	      end
	    end 	
	end

	def show
		@pictuer = Pictuer.find_by(id:params[:id])
	end

	private
	    def pictuer_params
	      params.require(:pictuer).permit(:title, :description, :active, :image)
	    end
end
