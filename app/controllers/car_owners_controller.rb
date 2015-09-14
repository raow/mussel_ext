class CarOwnersController < ApplicationController
  load_and_authorize_resource

  def index
    @car_owners = @car_owners.page(params[:page])
  end

  def edit
  end

  def update
    if @car_owner.update(car_owner_params)
      redirect_to car_owners_url, notice: 'Car owner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @car_owner.destroy
    redirect_to car_owners_url, notice: 'Car owner was successfully destroyed.'
  end

  private
  def car_owner_params
    params.require(:car_owner).permit(:no, :name)
  end
end
