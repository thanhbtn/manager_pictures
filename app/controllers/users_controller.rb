class UsersController < ApplicationController
	before_action :redirect_login
	layout "application"
  def index
  	@users = User.all
  end
end
