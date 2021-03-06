# frozen_string_literal: true

# couriers controller
class CouriersController < ApplicationController
  before_action :set_courier, except: %i[index new create]
  def index
    @couriers = Courier.all
  end

  def new
    @courier = Courier.new
  end

  def create
    @courier = Courier.new(courier_params)

    if @courier.save
      redirect_to @courier
    else
      render :new
    end
  end

  def show
    @package = @courier.packages.new
  end

  def edit; end

  def update
    if @courier.update(courier_params)
      redirect_to @courier
    else
      render :edit
    end
  end

  def destroy
    @courier.destroy
    redirect_to couriers_path
  end

  private

  def set_courier
    @courier = Courier.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(%i[name email])
  end
end
