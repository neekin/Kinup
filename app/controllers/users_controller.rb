class UsersController < ApplicationController
  def signup
    @user=User.new
  end

  def create
    @user = User.new(user_params)
     if @user.save
        cookies[:auth_token] = @user.auth_token
        redirect_to :root
     else
         render :signup
       end
  end

  def create_login_session
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      #cookies.permanent[:auth_token] =user.auth_token //持久化保存
      cookies[:auth_token] = user.auth_token   #临时性保存 类似 session
      redirect_to :root
    else
      redirect_to :login
    end
  end
  def logout
    cookies.delete(:auth_token)
    redirect_to :root
  end

  def info
  end

  def headimg
    file = params[:user][:headimg]
    directory = "public/image"
    path = File.join(directory,file.original_filename)

    if file
      File.open(path,"wb") do |f|
        f.write(file.read)
      end
    end
    render plain:file.original_filename.inspect
   # headimg = params[:user][:headimg]
   # filename = params[:user][:filename]
   # File.open(filename,"wb") do |file|
   # file.write(headimg.read)
   # end
   # @current_user.headimg => params[:user][:headimg]
   # @current_user.save
   # render plain:params[:user][:headimg].inspect

  end

  private
  def user_params
    params.require(:user).permit!
  end
end