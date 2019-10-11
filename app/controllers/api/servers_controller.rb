class Api::ServersController < ApplicationController
  before_action :require_logged_in

  def index
    @servers = Server.all
    render :index
  end

  def show
    @server = Server.find(params[:id])
    render :show
  end

  def create
    @server = Server.new(user_params)

    if @server.save
      render :index
    else
      render json: @server.errors.full_messages, status: 422
    end
  end

  def update
    @server = Server.find(params[:id])
    if @server.update_attributes(server_params)
      render :show
    else
      render json: @server.errors.full_messages, status:422
    end

  end

  def destroy
    @server = Server.find(params[:id])
    @server.destroy
  end

  private
  def server_params
    params.require(:server).permit(:title)
  end
end