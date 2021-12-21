class Api::V1::StoresController < ApplicationController
  # before_action :authenticate_user!

  def index
    @stores = Store.all
    render json: { stores: @stores, code: 200 }
  end

  def create
    @store = Store.new(body_params)
    if @store.save
      render json: {
        message: 'Store Added',
        code: 201
      }
    else
      render json: {
        message: @store.errors.messages,
        code: 417
      }
    end
  end

  def update
    @store = Store.find(params[:id])

    if @store.update(body_params)
      render json: {
        message: 'Store Updated',
        code: 201
      }
    else
      render json: {
        message: @store.errors.messages,
        code: 400
      }
    end
  end

  def destroy
    @store = Store.find_by(id: params[:id])
    if @store
      @store.destroy
      render json: {
        message: 'Store deleted succesfully',
        code: 202
      }
    else
      render json: {
        message: 'Store does not exist',
        code: 204
      }
    end
  end

  private

  def body_params
    params.permit(:nombre, :direccion, :telefono, :id)
  end
end
