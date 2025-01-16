class SessionController < ApplicationController
  require 'net/http'
  require 'uri'

  def lobby
    @keycloak_url = "http://localhost:8080/realms/SW_ORDER/protocol/openid-connect/auth?client_id=sw_order_localhost&redirect_uri=http://localhost:3000/callback&response_type=code&scope=openid"
  end

  def callback
    code = params[:code]
    if code.nil?
      redirect_to lobby_path
    else
      tokens = KeycloakService.get_token(code)
      user_info = KeycloakService.get_user_info(tokens["access_token"])
      if user_info.nil?
        redirect_to lobby_path
      end
      access_token = tokens["access_token"]
      refresh_token = tokens["refresh_token"]
      session[:access_token] = access_token
      print("user_info:------- #{user_info}")
      redirect_to index_path
    end
  end

  def logout
    session.delete(:access_token)
    redirect_to lobby_path
  end
end
