class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :user_sign_in?

#  rescue_from Exception, with: :error500
#  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  def error404(e)
    render 'error404', status: 404, formats: [:html]
  end

  def error500(e)
    logger.error [e,*e.backtrace].join("\n")
    render 'error500', status: 500, formats: [:html]
  end



  private


  def authenticate
	return if user_signed_in?
    
    redirect_to root_path, alert: 'ログインしてください'
  end

end