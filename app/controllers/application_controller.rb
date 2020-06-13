class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authenticate
    #if문을 뒤에 쓸수도 있다. 유저가 로그인이 안되었으면 로그인창으로 이동 
    # redirect_to new_session_path if !user_signed_in? 는 다음과 같다 
    redirect_to new_session_path unless user_signed_in?
  end
  
  def authenticate_admin
    unless current_user.admin
      flash[:alert] = 'no admin'
      redirect_to '/'
    end
  end
end
