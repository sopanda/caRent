class HomeController < ApplicationController
  #before_action :authenticate_user

  def index
    render json: { msg: 'hello world' }
  end
end
