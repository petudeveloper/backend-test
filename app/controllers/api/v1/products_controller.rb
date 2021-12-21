class Api::V1::StoresController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.new(reservation_params)
    @product.user_id = current_user.id
    if @reservation.save
      render json: {
        message: 'Product Added',
        code: 201
      }
    else
      render json: {
        message: @product.errors.messages,
        code: 417
      }
    end
  end

  private

  def body_params
    params.permit(:image, :nombre, :codigo, :precio, :descripcion)
  end
end
