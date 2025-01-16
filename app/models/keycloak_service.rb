class KeycloakService < ApplicationRecord
  require 'uri'
  require 'net/http'


  def self.get_token(code)
    Rails.logger.info "Code received: #{code}"
    uri = URI('http://localhost:8080/realms/SW_ORDER/protocol/openid-connect/token')
    params = {
      'grant_type' => 'authorization_code',
      'code' => code,
      'redirect_uri' => 'http://localhost:3000/callback',
      'client_id' => 'sw_order_localhost',
      'client_secret' => 'FEFn3qy1lHWnTzeuvwfRcaU5qlGJZcG7'
    }
    encoded_params = URI.encode_www_form(params)
    headers = {
      'Content-Type' => 'application/x-www-form-urlencoded'
    }
  
    response = Net::HTTP.post(uri, encoded_params, headers)
    token = JSON.parse(response.body)
    return token    
  end

  def self.get_user_info(access_token)
    uri = URI('http://localhost:8080/realms/SW_ORDER/protocol/openid-connect/userinfo')
    headers = {
      'Authorization' => "Bearer #{access_token}"
    }
    response = Net::HTTP.get_response(uri, headers)
    user_info = JSON.parse(response.body)
    return user_info
  end
  
end
