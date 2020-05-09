class WelcomesController < ApplicationController
  def index
    @user = User.name
  end
end
