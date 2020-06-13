module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # @current_user 는 인스턴스 변수로 조금 더 오래남는 변수다/
    # 위의 코드와 같이 @current_user = User.find_by(id: sessions[:user_id]) 한줋로 퉁쳐도 되지만
    # 메뉴바를 보여줄 때 마다(매 액션마다) db를 조회하면 성능이 느려지므로 방지한다.
    def current_user
        if @current_user.nil?
            @current_user = User.find_by(id: session[:user_id])
        else
            @current_user = @current_user
        end
        #한줄로 표현하면
        #@current_user = @current_user || User.find_by(id: session[:user_id])
        #or
        #@current_user ||= User.find_by(id: session[:user_id])
    end
    
    def user_signed_in?
        !current_user.nil?
    end
    
    def log_out
        #session[:user_id] = nil 해도 됨
        session.delete(:user_id)
        @current_user = nil
    end
    
end
