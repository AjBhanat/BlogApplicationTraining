class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    #before_action :authenticate_user!
  around_action :log_reqest_response

  def log_reqest_response
    begin
      # Do before action...
      logger.info 'I am before action'
      yield

      # Do after action...
      logger.info 'I am after action'
    ensure
      #raise ActiveRecord::Rollback
    end
  end
  #rescue_from CanCan::AccessDenied do | exception |
  #  redirect_to root_url, alert: exception.message
  #end
end
