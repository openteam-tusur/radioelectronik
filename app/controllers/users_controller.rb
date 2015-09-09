require 'open-uri'
class UsersController < ApplicationController
  def search
    url = "#{Settings['profile.users_url']}?term=#{params[:term]}"

    result = open(URI.encode(url)).read

    render :json => result
  end
end
