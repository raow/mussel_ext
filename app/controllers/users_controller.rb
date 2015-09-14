class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def new
    
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def approve
    @user.approve!
    redirect_to users_url, notice: '用户审批通过.'
  end

end
