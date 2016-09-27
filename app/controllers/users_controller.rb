class UsersController < ApplicationController
  def index
  end

  def register
  	user = User2.new(name:params[:name],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation], Description:params[:description])
  	if user.valid?
  		user.save
      session[:user_id] = user.id
  		redirect_to '/professional/index'
  	else
  		redirect_to '/', :notice => user.errors.full_messages
  	end

  end

  def login
  	if !params[:email].blank? && !params[:password].blank?
  		user = User2.find_by_email(params[:email])
	  	if user
	  		if  user.authenticate(params[:password])
	  			session[:user_id] = user.id
	  			redirect_to '/professional/index'
	  		else
	  			redirect_to '/', :alert =>  "email password combo dont match"
	  		end
	  	else
	  		redirect_to '/', :alert =>  "email doesnt exist"
	  	end
	  else
	  	redirect_to '/', :alert =>  "email and password cant be blank"
	  end
  end



end
