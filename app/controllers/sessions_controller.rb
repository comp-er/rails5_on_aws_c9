class SessionsController < ApplicationController
  def new
  end
  
  def create
    #유저를 이메일로 찾아서 있으면 user가 ture취급
    #그리고 비밀번호를 해싱해서 일치하나 확인 
    #둘다 참이면 로그인
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      #세션이라는 키워드에 해시처럼 관리
      #다음부터 세션하고 유저아이디로 불러오면, 로그인한 사용자의 아이디를 불러올 수 있게 된다. 
      #어느 액션에서나 볼 수 있다.
      #세션에 user_id가 있으면 전부 로그인된 사용자로 처리
      log_in(user)
      redirect_to '/'
    else
      #sessions/new.html.erb에서 맨 위에 소스코드 추가필요 <%= flash[:alert]%>
      flash[:alert] = 'Invalid email/password combination'
      #sessions/new의 prefix가 new_session 이므로
      redirect_to new_session_path
    end
  end
  
  def destroy
    log_out
    redirect_to '/'
  end
end
