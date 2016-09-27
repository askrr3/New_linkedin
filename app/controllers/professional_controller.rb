class ProfessionalController < ApplicationController
  def index
    @user = User2.find(session[:user_id])
    @alluser = User2.where.not(id:session[:user_id])
# show all user_id that has the session_id in "network_connection_id" column with pending "status"
    @invites = Networking.where(network_connection_id:session[:user_id], status: "pending")
    @accepted = Networking.where(network_connection_id:session[:user_id], status: "accepted")
  end

  def accepted
    # when you accept, the person that sent the request doesnt see the accepted request.....
    @accept = Networking.find_by(id: params[:id]).update(status: "accepted")
    # Networking.create(user_id:params[:id], network_connection_id: session[:user_id], status:"accepted")

    # Networking.update(user_id:params[:id], network_connection_id: session[:user_id], status:"accepted")
    # if params[:id].to_i + 1
    #   Networking.find_by(id:params[:id].to_i+   1).update(status:"accepted")
    # end
    redirect_to '/professional/index'
  end

  def ignore
    Networking.find_by(user_id:session[:user_id], network_connection_id:params[:id]).destroy
    Networking.find_by(user_id:params[:id], network_connection_id:session[:user_id]).destroy
    redirect_to '/professional/index'
  end

  def remove
    Networking.find_by(user_id:session[:user_id], network_connection_id:params[:id]).destroy
    Networking.find_by(user_id:params[:id], network_connection_id:session[:user_id]).destroy
    redirect_to '/professional/index'
  end

  def show
    users = User2.all
    @networks = Networking.where(user_id: User2.find(session[:user_id])).pluck(:network_connection_id)
    @current = []
    
    users.each do |user|
      @current.push(user)
    end

    @alluser = User2.where.not(id:session[:user_id])
    @show = Networking.where.not(status: "pending").pluck(:network_connection_id)
    @show2 = Networking.where.not(status: "accepted").pluck(:user_id)

  end

  def connecting
    Networking.create(user_id:session[:user_id], network_connection_id: params[:id], status:"pending")
    Networking.create(user_id:params[:id], network_connection_id: session[:user_id], status:"pending")
    redirect_to '/professional/show'
  end

  def showUser
    @alluser = User2.find_by(id:params[:id])
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
