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
    @server = Server.new(server_params)
    # debugger
    if @server.save
      # @serverMembership = Membership.new(user_id: current_user.id, membership_id: @server.id, membership_type: "Server")
      # @serverMembership.save!
      # @channel = Channel.new(title: "General", server_id: @server.id, topic: "Default topic!")
      # @channel.save!
      # @channelMembership = Membership.new(user_id: current_user.id, membership_id: @channel.id, membership_type: "Channel")
      # @channelMembership.save!
      @server.setup_server(current_user.id)

      render :show
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
    params.require(:server).permit(:title, :admin_id)
  end
end
