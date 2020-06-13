class ContactsController < ApplicationController
  #ContactsController 에 있는 모든 액션을 실행하기 전에 authenticate 를 실행
  before_action :authenticate
  
  
  def index
    @all_contacts = Contact.all #배열 형태로 저장된다
  end

  def new
  end

  def create
    @name = params[:name]
    @email = params[:email]
    @content = params[:content]
    new_contact = Contact.new(name: @name, email: @email, content: @content)
    if new_contact.save #저장 결과를 bool값으로 리턴한다
      redirect_to contacts_path #/contacts/index에서 변경:세이브가 완료되면 컨텍츠들의 리스트를 보는 뷰로 간다
    else
      redirect_to new_contact_path #/contacts/new에서 변경:세이브가 실패하면 폼으로 다시 돌아간다
    end
  end
end
