class ApplicationController < ActionController::Base
  def isLogin
    if session[:access_token].nil?
      redirect_to lobby_path
    end
  end
end
