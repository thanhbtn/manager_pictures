class AlbumsController < ApplicationController
	before_action :redirect_login
  before_action :new_album, only: [:new, :update]
  before_action :find_album, only: [:edit, :destroy]
  def index
  	
  end

  def new
  	
  end

  def create
  	@album = Album.new(getparams)
  	@album.user_id = current_user.id
  	respond_to do |format|
      if @album.save
        format.html { redirect_to root_path }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    
  end

  def update
    respond_to do |format|
      @album.user_id = current_user.id
      if @album.update(getparams)
        format.html { redirect_to  album_pictuers_path(@album) }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    redirect_to root_url
  end

  private

  def getparams
  	params.require(:album).permit(:title,:name, :description,:active, pictuers_attributes: [:title,:name, :description, :active, :image, :_destroy])
  end
  def new_album
    @album = Album.new
  end

  def find_album
    @album = Album.find_by(id:params[:id])
  end
end
