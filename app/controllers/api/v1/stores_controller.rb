class Api::V1::StoresController < ApplicationController
  def index
    @stores = Store.all
    render json: { stores: @stores, code: 200 }
  end

  def create
    @store = Store.new(request_parameters)
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

end
